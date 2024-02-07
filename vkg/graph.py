from rdflib.extras.external_graph_libs import rdflib_to_networkx_multidigraph
from pyvis.network import Network
import rdflib

g = rdflib.Graph()
a = g.parse("atkis1.ttl", format="turtle")

G = rdflib_to_networkx_multidigraph(a)

# Create an interactive graph
nt = Network()

# Add nodes and edges to the interactive graph
for node, data in G.nodes(data=True):
    nt.add_node(node, label=node)

for edge in G.edges():
    nt.add_edge(edge[0], edge[1])

# Visualize the interactive graph
nt.show("graph.html", notebook=False)