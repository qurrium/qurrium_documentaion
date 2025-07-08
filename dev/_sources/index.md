# Qurrium

**_The python package for measuring quantum entanglement entropy and wave function overlap_**

**_Make the randomized measurement easy_**

---

The major function includes the measurement of quantum Renyi Entropy and Wave Function Overlap based on the randomized measurement protocol.
When interfaced with **IBM Qiskit**, the package automates the workflow from creating experiment objects, job submission and recall and postprocessing.  
There are several additional features, such as measurement of magnetization and error mitigation. Please check them out!

[![PyPI Downloads](https://static.pepy.tech/badge/qurrium/month)](https://pepy.tech/projects/qurrium)

## Installation

```bash
pip install qurrium
```

Check [Installation](./more_info/install.md) for more detail.

## Environment

**Qurrium currently <ins>SUPPORT qiskit 0.46.0+ and qiskit 1.0.0+</ins>, other lower versions are no longer available.
The package has been tested on the following systems.**

- **Ubuntu 18.04+ LTS (All ManyLinux 2014 compatible distro)**
- **Windows 10/11**
- **MacOS 11+**
- with required modules:
  - [qiskit](https://pypi.org/project/qiskit/),
  - [tqdm](https://pypi.org/project/tqdm/),
  - [requests](https://pypi.org/project/requests/)

Check [Platform Support](./more_info/platform_support.md) for more detail.

---

## Measurement -- made randomized measurement easy.

```{toctree}
:maxdepth: 1
:caption: Tutorials

Basic Usage <basic_usage/index>
Multiple Output <multi_output/index>
Post-Processing <postprocessing/index>
Other Features <appendix/index>

```

```{toctree}
:maxdepth: 1
:caption: API

API Reference <api/index>

```

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

Check [About](./more_info/about.md) for more detail.

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

```{toctree}
:maxdepth: 1
:hidden:
:caption: Information

More Information <more_info/index>

```

---

### Stay connected. More features coming soon...
