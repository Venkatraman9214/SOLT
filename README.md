# SOLT
This is the MATLAB simulation of SOLT a state-of the art load balancer. Its primary purpose is to justify the scenarios where even distribution of 
workload is not possible. In such scenarios and also scenarios where there is a need for fractional assignment JSQ might not be a convenient choice. Fractional
assignment refers to the allocation or assignment of fractional units or portions of a resource to different entities or components within 
a system. It is used when dividing a limited resource among multiple entities where each entity can be assigned a fraction or portion of the resource.
In the context of tis simulation, fractional assignment refers to keeping track of the number of times a particular server is selected or
chosen in the SOLT algorithm. Instead of assigning a whole unit or discrete count to each server, the algorithm incrementally increases 
the fractional assignment value for a server each time it is selected. For example, if a server has a fractional assignment value of 5, it means that the 
server has been selected or chosen 5 times during the simulation. The fractional assignment value provides a measure of how frequently a particular server
is being utilized or allocated resources relative to other servers in the network. By tracking the fractional assignment, it becomes possible to analyze the 
load distribution, resource utilization, or performance characteristics of the system based on the number of times 
servers are chosen or assigned resources in a fractional manner.
