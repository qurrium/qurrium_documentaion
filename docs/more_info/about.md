# About

## Why name Qurry / Qurrium

1. The name **qurrent** was the second proposed name for this package.
   It’s not simply **current** with a **q** replacing the **c**,
   but rather a combination of **qurr** and **ent**, where **ent** abbreviates **entropy**,
   and **qurr** is a coined prefix beginning with **qu** to imply **quantum**.

2. The initial proposed name for the package was **xproc**, short for **experimental process**.

3. Another module, **qurrech**, combines **qurr** with **ech**,
   where **ech** is short for **echo**,
   the Loschmidt echo being a key concept in quantum information theory.
   This inspired us to adopt **qurry**, derived from **qurr** and the suffix **ry**,
   to resemble words like **query** or **curry**.

4. Since a package named **qurry** already exists on PyPI,
   and many projects on GitHub also use this name,
   we changed the suffix from **y** to **ium**, creating **qurrium**.
   **Qurrium** is unique and easily searchable,
   with no prior use on PyPI or in general web searches.

5. So there is the evolution of the package name:
   **`xproc -> qurrent -> qurry -> qurrium`**

6. Emoji: Qurry🍛/Qurrium📏

## Citation

If you use this tool in your research, please cite the following paper in your publication:

```bibtex
@article{PhysRevResearch.7.013043,
  title     = {Probing entanglement dynamics and topological transitions on noisy intermediate-scale quantum computers},
  author    = {Chang, Huai-Chun and Hsu, Hsiu-Chuan and Lin, Yu-Cheng},
  journal   = {Phys. Rev. Res.},
  volume    = {7},
  issue     = {1},
  pages     = {013043},
  numpages  = {12},
  year      = {2025},
  month     = {Jan},
  publisher = {American Physical Society},
  doi       = {10.1103/PhysRevResearch.7.013043},
  url       = {https://link.aps.org/doi/10.1103/PhysRevResearch.7.013043}
}
@mastersthesis{Chang2024,
  title      = {Probing Entanglement Entropy on Near-term Quantum Computers},
  author     = {Huai-Chun Chang},
  year       = {2024},
  school     = {National Chengchi University},
  department = {Graduate Institute of Applied Physics},
  advisor    = {Hsiu-Chuan Hsu},
  committee  = {Yu-Cheng Lin, Ying-Jer Kao, Chiao-Hsuan Wang},
  degree     = {Master's},
  abstract   = {In this thesis, we explore the quench dynamics of the Su–Schrieffer–Heeger (SSH) model and quantum entanglement using Noisy Intermediate-Scale Quantum (NISQ) computers, specifically on the IBM Quantum platform. We investigate the second-order Renyi entropy through randomized measurements to characterize the entanglement of quantum states. To simulate partial-dimerized quench Hamiltonians, we employ Trotter decomposition with an adaptive step size to reduce circuit depth. In the fully dimerized limit, the time evolution operator is exactly mapped to quantum gates, which minimizes noise. After applying error mitigation techniques, we find that the entanglement entropy oscillations align with theoretical predictions. Additionally, we developed a Python package called Qurry to manage workflows and facilitate parallel post-processing. Finally, we analyze the error scaling of Renyi entropy measurements and discuss the challenges encountered when simulating larger systems.},
  keywords   = {Noisy Intermediate-Scale Quantum Device, IBM Quantum, Quench dynamics, Su–Schrieffer–Heeger model, Renyi entropy, Randomized measurement, Error mitigation},
  language   = {zh-TW},
  pages      = {134},
  url        = {https://hdl.handle.net/11296/828e7d}
}

```

## Acknowledgments

The authors acknowledge the support from [National Chengchi University](https://www.nccu.edu.tw/), [NSTC-Quantum Virtual Machine project](https://www.nstc.gov.tw/), [National Center for Theoretical Sciences (NCTS)](https://phys.ncts.ntu.edu.tw/).
and [IBM Quantum Hub at National Taiwan University (NTU)](https://quantum.ntu.edu.tw/).

Special thank to [IBM Quantum Hub at NTU](https://quantum.ntu.edu.tw/) for providing the access right of [IBM Quantum](https://quantum-computing.ibm.com/) that allows us to fully test the tool and execute our experiments.

The author [@harui2019](https://github.com/harui2019/) is grateful to the NTU hub of [NCTS](https://phys.ncts.ntu.edu.tw/) that supported him as a Research Assistiant in the early stage of the development.

<a href="https://www.nccu.edu.tw/">
  <img
    src="https://raw.githubusercontent.com/harui2019/harui2019/main/docs/image/logo/NCCU_Physics_Logo.png"
    alt="National Chengchi University"
    width="400"
  >
</a>

<a href="https://www.nstc.gov.tw/">
  <img
    src="https://raw.githubusercontent.com/harui2019/harui2019/main/docs/image/logo/NSTC_Logo.png"
    alt="NSTC"
    width="400"
  >
</a>

<a href="https://phys.ncts.ntu.edu.tw/">
  <img
    src="https://raw.githubusercontent.com/harui2019/harui2019/main/docs/image/logo/NCTS_Phys_Logo.png"
    alt="National Center for Theoretical Sciences, Physics Division"
    width="400"
  >
</a>

<a href="https://quantum.ntu.edu.tw/">
  <img
    src="https://raw.githubusercontent.com/harui2019/harui2019/main/docs/image/logo/NTU_IBM_Q_Hub_Logo.png"
    alt="IBM Quantum Hub at National Taiwan University"
    width="400"
  >
</a>
