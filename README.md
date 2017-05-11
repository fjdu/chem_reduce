# Example config file

```fortran
! Filename: configure.dat
! Usage
! Just modify this file and run ./a.out again.
! The default name of this file is config.dat.
! You can use another name, e.g., XXX.dat, then
! run the program like this: ./a.out XXX.dat
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
nPhyPar = 1
Temperature_s = 1D4
n_H_s =         1D12
Av_s =          0D0
file_imp_species_in = "species_we_care_about.dat"
file_imp_reacs_out = "rate06_dipole_reduced_20140223.dat"
n_time_care = 10
time_care = 1E-3  1E-2  1E-1  1E0  1E1  1E2  1E3  1E4  1E5  1E6  ! The time intervals we care about
allow_dead_end = .FALSE.
ratio_tobe_imp = 0.99  0.95  0.95  0.9  0.9  0.5  0.5  0.3  0.1
use_acum_threshold = .TRUE.
tScaleMax = 1.0E15
nHeavyEleMax = 5  ! Max number of heavy elements in species to be kept
nMaxD = 4  ! Max number of deuterium atoms in species to be kept
nMaxC = 5  ! ... of carbon
abundMaxHeavy = 1E-50
abundMaxSecondary = 1E-50
abundMaxC = 1D-50
prio_reac_threshold = 0.001
prio_spe_threshold = 0.001
fLog = "Log.dat"
/
```
