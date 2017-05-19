# How to use

`git clone https://github.com/fjdu/chem_reduce.git`

`cd chem_reduce`

`make`

`./reduce config_reduce_20140223.dat`

Edit the `ReduceParameters` section of the configuration file as needed.  You can also change other parameters.

# Example config file

```fortran
! Filename: configure.dat
! Usage
!   Just modify this file and run ./reduce.
!   The default name of this file is config.dat.
!   You can use another name, e.g., XXX.dat, then
!   run the program like this: ./reduce XXX.dat
!
&PhysicalParameters
!Av = 3.0D0 ! NHtotal / 1.6D21; obsolete: changed into AV_s now
omega_Albedo = 0.5D0
rateCosIon = 3.0D-17
rateHHH2 = 3.003953e-18 !3.002221e-18 !
!stickCoeffHH = 1D0
!stickCoeffChargeGrain = 0.8D0 !0.5D0
ratioDustGasMass = 1.3D-30
!ratioHDust = 2.857143E11 ! 1D0/3.5D-12
GrainDensity = 2.0D0 ! g/cm^3
GrainRadius = 1.0D-1 ! micron !for gas-to-dust ratio, coulomb correction, rate correction
GrainRadiusBase = 0.02 !0.0202 ! micron ! for rate correction
aGrainMin = 1.0D-5 ! 1D-6 !cm ! only used for calculating the H+H->H2 rate
aGrainMax = 1.0D-5 ! 3D-5 !cm ! only used for calculating the H+H->H2 rate
timeUnit = 1.0D2 ! in years
nSpecies_Est = 1024
rateThreshold = 0D0
/
&ODEParameters
nIteration = 650
RTOL = 1.0D-6 ! relative tolerance
ATOL = 1.0D-30 ! absolute tolerance
/
&Paths
path = "./"
fReactions = "rate06_dipole_reformated_again.dat"  ! Reaction network to be reduced
fInitialCondition = "initial_condition_low_metal.dat" ! Initial condition
fSaveFinalResult = "final_abundance_20130528.txt"  ! Save final abundances into this file
/
&ReduceParameters
nPhyPar = 3  ! Number of the groups of physical parameters
! The following means we care about three different physical conditions:
! 1. T = 10  K, n = 1D11 cm-3, Av = 20
! 2. T = 30  K, n = 1D9  cm-3, Av =  5
! 3. T = 100 K, n = 1D2  cm-3, Av =  1
Temperature_s = 10.0   30.0  1D2
n_H_s =         1D11   1D9   1D8
Av_s =          20.0   5D0   1D0
file_imp_species_in = "species_we_care_about.dat"
file_imp_reacs_out = "rate06_dipole_reduced_20140223.dat"
! The time steps we care about
n_time_care = 10
time_care = 1E-3  1E-2  1E-1  1E0  1E1  1E2  1E3  1E4  1E5  1E6  ! The time intervals we care about
allow_dead_end = .FALSE.
! The code recursively finds out the important reactions and species at each
! time step we care about.  The ratio_tobe_imp parameter specifies the threshold for
! a reaction to be considered important at each recursion.
! The actual ratio_tobe_imp array will be longer than this; the remaining
! elements are padded with the minval of those specified below.
! The use_acum_threshold = .TRUE. means the thresholds are based on accumulated contribution of the
! reactions, hence 0.95 means the reactions that collectively contribute to 95% of the reaction rates
! are kept.
ratio_tobe_imp = 0.99  0.95  0.95  0.9  0.9  0.5  0.5  0.3  0.1
use_acum_threshold = .TRUE.
! A reaction with time scale longer than tScaleMax will be discarded.
tScaleMax = 1.0E15
nHeavyEleMax = 5  ! Max number of elements beyond He in species to be kept
nMaxD = 4  ! Max number of deuterium atoms in species to be kept
nMaxC = 5  ! ... of carbon
abundMaxHeavy = 1E-50  ! A species will not be removed unless its abundance is lower than this.
abundMaxSecondary = 1E-50  ! For similar purpose
abundMaxC = 1D-50
prio_reac_threshold = 0.001  ! Reactions with relative importance higher than this will not be removed.
prio_spe_threshold = 0.001  ! Similar
fLog = "Log.dat"
/
```
