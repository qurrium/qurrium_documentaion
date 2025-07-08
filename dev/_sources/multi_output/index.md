# Multi-Output

**Before start reading, make sure you are familiar with the basic usage of Qurrium. If you are not, please refer to the [Basic Usage](../basic_usage/index.md) section.**

In the previous section, we have learned how to use the basic function of Qurrium. In this chapter, we will learn that Qurrium provides a more advanced approach, where the true power of Qurrium lies.

## 1. Entanglement Entropy

This part will introduce several methods to compute the entanglement entropy of a quantum system. The methods include:

```{toctree}
:maxdepth: 1
:caption: Entanglement Entropy

qurrent_1_1_hadamard_test
qurrent_1_2_randomized_measure
qurrent_1_3_classical_shadow

```

## 2. WaveFuction Overlap

This part will introduce several methods to compute the wavefuction overlap between 2 quantum system. The methods include:

This feature has been implemented. The documentation is coming...

## 3. Magnetization Square

This part will introduce several methods to compute the magnetization square of a quantum system. The methods include:

This feature has been implemented. The documentation is coming...

<!-- ## 4. String Operator

This part will introduce several methods to compute the order of string operator of a quantum system. The methods include:

This feature has been implemented. The documentation is coming... -->

## Extra. Workflow Tools

```{toctree}
:maxdepth: 1
:caption: Workflow Tools

qurrium_0_1_waves_executer
```

## Reference

### Randomized Measurement

- Probing Rényi entanglement entropy via randomized measurements - Tiff Brydges, Andreas Elben, Petar Jurcevic, Benoît Vermersch, Christine Maier, Ben P. Lanyon, Peter Zoller, Rainer Blatt ,and Christian F. Roos [doi:10.1126/science.aau4963](https://www.science.org/doi/abs/10.1126/science.aau4963)

  ```bibtex
  @article{
  doi:10.1126/science.aau4963,
  author = {Tiff Brydges  and Andreas Elben  and Petar Jurcevic  and Benoît Vermersch  and Christine Maier  and Ben P. Lanyon  and Peter Zoller  and Rainer Blatt  and Christian F. Roos },
  title = {Probing Rényi entanglement entropy via randomized measurements},
  journal = {Science},
  volume = {364},
  number = {6437},
  pages = {260-263},
  year = {2019},
  doi = {10.1126/science.aau4963},
  URL = {https://www.science.org/doi/abs/10.1126/science.aau4963},
  eprint = {https://www.science.org/doi/pdf/10.1126/science.aau4963},
  abstract = {Quantum systems are predicted to be better at information processing than their classical counterparts, and quantum entanglement is key to this superior performance. But how does one gauge the degree of entanglement in a system? Brydges et al. monitored the build-up of the so-called Rényi entropy in a chain of up to 10 trapped calcium ions, each of which encoded a qubit. As the system evolved, interactions caused entanglement between the chain and the rest of the system to grow, which was reflected in the growth of the Rényi entropy. Science, this issue p. 260 The buildup of entropy in an ion chain reflects a growing entanglement between the chain and its complement. Entanglement is a key feature of many-body quantum systems. Measuring the entropy of different partitions of a quantum system provides a way to probe its entanglement structure. Here, we present and experimentally demonstrate a protocol for measuring the second-order Rényi entropy based on statistical correlations between randomized measurements. Our experiments, carried out with a trapped-ion quantum simulator with partition sizes of up to 10 qubits, prove the overall coherent character of the system dynamics and reveal the growth of entanglement between its parts, in both the absence and presence of disorder. Our protocol represents a universal tool for probing and characterizing engineered quantum systems in the laboratory, which is applicable to arbitrary quantum states of up to several tens of qubits.}}
  ```

### Error Mitigation on Randomized Measurement

- Simple mitigation of global depolarizing errors in quantum simulations - Vovrosh, Joseph and Khosla, Kiran E. and Greenaway, Sean and Self, Christopher and Kim, M. S. and Knolle, Johannes [PhysRevE.104.035309](https://link.aps.org/doi/10.1103/PhysRevE.104.035309)

  ```bibtex
  @article{PhysRevE.104.035309,
    title = {Simple mitigation of global depolarizing errors in quantum simulations},
    author = {Vovrosh, Joseph and Khosla, Kiran E. and Greenaway, Sean and Self,
    Christopher and Kim, M. S. and Knolle, Johannes},
    journal = {Phys. Rev. E},
    volume = {104},
    issue = {3},
    pages = {035309},
    numpages = {8},
    year = {2021},
    month = {Sep},
    publisher = {American Physical Society},
    doi = {10.1103/PhysRevE.104.035309},
    url = {https://link.aps.org/doi/10.1103/PhysRevE.104.035309}
  }

  ```

### Classical Shadow

- Predicting many properties of a quantum system from very few measurements - Huang, Hsin-Yuan and Kueng, Richard and Preskill, John [doi:10.1038/s41567-020-0932-7](https://doi.org/10.1038/s41567-020-0932-7)

  ```bibtex
  @article{Huang2020-xg,
    title    = "Predicting many properties of a quantum system from very few
                measurements",
    author   = "Huang, Hsin-Yuan and Kueng, Richard and Preskill, John",
    abstract = "Predicting the properties of complex, large-scale quantum systems
                is essential for developing quantum technologies. We present an
                efficient method for constructing an approximate classical
                description of a quantum state using very few measurements of the
                state. This description, called a `classical shadow', can be used
                to predict many different properties; order
                $$\{\textbackslashmathrm\{log\}\}\textbackslash,(M)$$measurements
                suffice to accurately predict M different functions of the state
                with high success probability. The number of measurements is
                independent of the system size and saturates
                information-theoretic lower bounds. Moreover, target properties
                to predict can be selected after the measurements are completed.
                We support our theoretical findings with extensive numerical
                experiments. We apply classical shadows to predict quantum
                fidelities, entanglement entropies, two-point correlation
                functions, expectation values of local observables and the energy
                variance of many-body local Hamiltonians. The numerical results
                highlight the advantages of classical shadows relative to
                previously known methods.",
    journal  = "Nature Physics",
    volume   =  16,
    number   =  10,
    pages    = "1050--1057",
    month    =  oct,
    year     =  2020
  }
  ```

- The randomized measurement toolbox - Elben, Andreas and Flammia, Steven T. and Huang, Hsin-Yuan and Kueng, Richard and Preskill, John and Vermersch, Benoît and Zoller, Peter [doi:10.1038/s42254-022-00535-2](https://doi.org/10.1038/s42254-022-00535-2)

  ```bibtex
  @article{Elben2023-bk,
    title    = "The randomized measurement toolbox",
    author   = "Elben, Andreas and Flammia, Steven T and Huang, Hsin-Yuan and
                Kueng, Richard and Preskill, John and Vermersch, Beno{\^\i}t and
                Zoller, Peter",
    abstract = "Programmable quantum simulators and quantum computers are opening
                unprecedented opportunities for exploring and exploiting the
                properties of highly entangled complex quantum systems. The
                complexity of large quantum systems is the source of
                computational power but also makes them difficult to control
                precisely or characterize accurately using measured classical
                data. We review protocols for probing the properties of complex
                many-qubit systems using measurement schemes that are practical
                using today's quantum platforms. In these protocols, a quantum
                state is repeatedly prepared and measured in a randomly chosen
                basis; then a classical computer processes the measurement
                outcomes to estimate the desired property. The randomization of
                the measurement procedure has distinct advantages. For example, a
                single data set can be used multiple times to pursue a variety of
                applications, and imperfections in the measurements are mapped to
                a simplified noise model that can more easily be mitigated. We
                discuss a range of cases that have already been realized in
                quantum devices, including Hamiltonian simulation tasks, probes
                of quantum chaos, measurements of non-local order parameters, and
                comparison of quantum states produced in distantly separated
                laboratories. By providing a workable method for translating a
                complex quantum state into a succinct classical representation
                that preserves a rich variety of relevant physical properties,
                the randomized measurement toolbox strengthens our ability to
                grasp and control the quantum world.",
    journal  = "Nature Reviews Physics",
    volume   =  5,
    number   =  1,
    pages    = "9--24",
    month    =  jan,
    year     =  2023
  }
  ```

### String Operator

- Crossing a topological phase transition with a quantum computer - Smith, Adam and Jobst, Bernhard and Green, Andrew G. and Pollmann, Frank [PhysRevResearch.4.L022020](https://link.aps.org/doi/10.1103/PhysRevResearch.4.L022020)

  ```bibtex
  @article{PhysRevResearch.4.L022020,
    title = {Crossing a topological phase transition with a quantum computer},
    author = {Smith, Adam and Jobst, Bernhard and Green, Andrew G. and Pollmann, Frank},
    journal = {Phys. Rev. Research},
    volume = {4},
    issue = {2},
    pages = {L022020},
    numpages = {8},
    year = {2022},
    month = {Apr},
    publisher = {American Physical Society},
    doi = {10.1103/PhysRevResearch.4.L022020},
    url = {https://link.aps.org/doi/10.1103/PhysRevResearch.4.L022020}
  }
  ```
