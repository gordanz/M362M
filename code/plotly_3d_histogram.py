#!/usr/bin/env python
# coding: utf-8

import numpy as np
import plotly.graph_objs as go
import plotly.io as pio

def bar_data(position3d, size=(1, 1, 1)):

    bar = np.array([[0, 0, 0],
                    [1, 0, 0],
                    [1, 1, 0],
                    [0, 1, 0],
                    [0, 0, 1],
                    [1, 0, 1],
                    [1, 1, 1],
                    [0, 1, 1]], dtype=float)  # the vertices of the unit cube

    # scale the cube to get the vertices of a parallelipipedic bar
    bar *= np.asarray(size)
    # translate each  bar on the directio OP, with P=position3d
    bar += np.asarray(position3d)
    return bar


def triangulate_bar_faces(positions, sizes=None):

    if sizes is None:
        sizes = [(1, 1, 1)] * len(positions)
    else:
        if isinstance(sizes, (list, np.ndarray)) and len(sizes) != len(positions):
            raise ValueError(
                'Your positions and sizes lists/arrays do not have the same length')

    all_bars = [bar_data(pos, size)
                for pos, size in zip(positions, sizes) if size[2] != 0]
    p, q, r = np.array(all_bars).shape

    # extract unique vertices from the list of all bar vertices
    vertices, ixr = np.unique(np.array(all_bars).reshape(
        p * q, r), return_inverse=True, axis=0)
    # for each bar, derive the sublists of indices i, j, k assocated to its chosen  triangulation
    I = []
    J = []
    K = []

    for k in range(len(all_bars)):
        I.extend(np.take(ixr, [8 * k, 8 * k + 2, 8 * k, 8 * k + 5, 8 * k, 8 * k + 7,
                               8 * k + 5, 8 * k + 2, 8 * k + 3, 8 * k + 6, 8 * k + 7, 8 * k + 5]))
        J.extend(np.take(ixr, [8 * k + 1, 8 * k + 3, 8 * k + 4, 8 * k + 1, 8 * k + 3,
                               8 * k + 4, 8 * k + 1, 8 * k + 6, 8 * k + 7, 8 * k + 2, 8 * k + 4, 8 * k + 6]))
        K.extend(np.take(ixr, [8 * k + 2, 8 * k, 8 * k + 5, 8 * k, 8 * k + 7, 8 * k,
                               8 * k + 2, 8 * k + 5, 8 * k + 6, 8 * k + 3, 8 * k + 5, 8 * k + 7]))

    return vertices, I, J, K  # triangulation vertices and I, J, K for mesh3d





def get_plotly_mesh3d(x, y, bins=[5, 5], bargap=0.05, range_extent=0.2):
    # x, y- array-like of shape (n,), defining the x, and y-ccordinates of data set for which we plot a 3d hist
    hist, xedges, yedges = np.histogram2d(x, y,
                                          bins=bins,
                                          range=[[x.min() - range_extent, x.max() + range_extent],
                                                 [y.min() - range_extent, y.max() + range_extent]])
    xsize = xedges[1] - xedges[0] - bargap
    ysize = yedges[1] - yedges[0] - bargap
    xe, ye = np.meshgrid(xedges[:-1], yedges[:-1])
    ze = np.zeros(xe.shape)

    positions = np.dstack((xe, ye, ze))
    m, n, p = positions.shape
    positions = positions.reshape(m * n, p)
    sizes = np.array([(xsize, ysize, h) for h in hist.flatten()])
    vertices, I, J, K = triangulate_bar_faces(positions, sizes=sizes)
    X, Y, Z = vertices.T
    return X, Y, Z, I, J, K


np.random.seed(1951)
mean = [0, 0]
sig = [0.6, 0.8]
rho = 0.57
cov = rho * sig[0] * sig[1]
Sigma = np.array([[sig[0]**2, cov], [cov, sig[1]**2]])  # covariance matrix

pts = np.random.multivariate_normal(mean, Sigma, size=500)

x = np.random.normal(size=10000)
z = np.random.normal(size=10000)
y = [ xx ** 2 for xx in x ] + z 
#y = np.random.permutation([ xx ** 2 for xx in x ] + z )




X, Y, Z, I, J, K = get_plotly_mesh3d(x, y, bins=[10, 10], bargap=0.05)

mesh3d = go.Mesh3d(x=X, y=Y, z=Z, i=I, j=J, k=K,
                   color="#cc5500", flatshading=True, opacity=1)

layout = go.Layout(width=650,
                   height=700,
                   title_x=0.5,
                   scene=dict(
                              camera_eye_x=-1.25,
                              camera_eye_y=1.25,
                              camera_eye_z=1.25),
                   showlegend=False,
                   hovermode=False
                   )
fig = go.Figure(data=[mesh3d], layout=layout )


pio.write_html(fig, config = {"displayModeBar": False},
    file="../source/pics/3dhist.html",auto_open=True,
    include_plotlyjs="cdn")
