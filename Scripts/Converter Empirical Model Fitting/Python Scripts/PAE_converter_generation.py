from import_measured_converter_harmonic_data_python import import_measured_converter_harmonic_data
from import_measured_converter_power_data_python import import_measured_converter_power_data
from loss_model_python import loss_model
from empirical_harmonic_model_python import empirical_harmonic_model


import os
import pandas as pd
import numpy as np
from scipy.io import savemat
# Clear plots
import matplotlib.pyplot as plt
plt.close('all')



#index = 0
fName_list = ["LCM-50-DCPCU", "LCM-250ACPCU", "SMA_STP-30000TL-US",  "LCM-50ACPCU"]

for index in range(len(fName_list)):
    # Configuration
    # Device data source directory
    #dataDirectory = '/Users/prat043/OneDrive - PNNL/Desktop/Local Code/Matlab to Python simple/Example Data/HP 677777-002 Laptop Charger/Processed Data'
    dataDirectory = \
    f'/Users/wagh847/gitlab/BEEAM/Scripts/Converter Empirical Model Fitting/Example Data/{fName_list[index]}/Processed Data'
    print(dataDirectory)

    #In order: LCM-50-DCPCU, LCM-250ACPCU, SMA STP-30000TL-US,  LCM-50ACPCU
    Pnom_list = [600, 500, 600, 50]
    # Device ratings
    Pnom = Pnom_list[index]          # W
    Vnom = 120         # V_ac
    Inom = Pnom / Vnom # A_ac

    # Commentary: The default device used in this example, a HP 677777-002 external
    # AC/DC power supply for laptop computers, is interesting because it exhibits
    # power factor correction at the higher end of its power range. This can be seen
    # clearly in the harmonic plots.

    #

    # Import Data
    # Use helper functions to import the data from CSV
    convData = {}
    convData['power'] = import_measured_converter_power_data(dataDirectory)



    # Fit Efficiency Model
    # Call efficiency model fitting function
    Pin = [x//1000 for x in convData['power']['Pin']]
    Pout = [x//1000 for x in convData['power']['Pout']]

    print(f"Pin for {fName_list[index]}: {Pin}")
    print(f"Pout for {fName_list[index]}: {Pout}")
    print(f"Pnom for {fName_list[index]}: {Pnom}")
    #print(Pout)
    lossCoeff = loss_model(Pin, Pout, Pnom)

    # Split out results into individual alpha, beta, gamma
    alpha = lossCoeff[0]
    beta  = lossCoeff[1]
    gamma = lossCoeff[2]

    # Modeled curves: Pout, Pin, Ploss, efficiency
    #See loss_model() documentation for how to apply alpha, beta, gamma
    mdl_Pout = Pnom * np.arange(0.1, 0.1, 1)
    #mdl_Pout  = Pnom .* (0.1,0.2,0.4,0.9,1,2,2.9,3.9,4.9,5.9,6.8,7.8,8.8,9.5,9.8,11.7,13.7,15.7,17.6,18.9,19.6,23.5,27.4,31.3,35.2,39.1,47.0,54.8,62.6,70.4,75.7);
    mdl_Pin = mdl_Pout + Pnom * (alpha + beta * (mdl_Pout / Pnom) + gamma * (mdl_Pout / Pnom) ** 2)
    mdl_Ploss = mdl_Pin - mdl_Pout
    mdl_Eff = mdl_Pout / mdl_Pin

    # # Plot: Loss curve
    # plt.figure(1)
    # plt.plot(Pout, (list(map(lambda a, b: a - b, Pin, Pout))), 'ob')
    # plt.plot(mdl_Pout, mdl_Ploss, '--r')
    # plt.xlabel('Pout (W)')
    # plt.ylabel('Loss (W)')
    # plt.title(f'{fName_list[index]} Pout vs Loss')
    # plt.legend(['Measurement', 'Model'])
    # plt.show(block=False)

    # # Plot: Efficiency curve
    # plt.figure(2)
    # plt.plot(Pout, (list(map(lambda a, b: a/b*100, Pout, Pin))), 'ob')
    # plt.plot(mdl_Pout, mdl_Eff * 100, '--r')
    # plt.xlabel('Pout (W)')
    # plt.ylabel('Efficiency')
    # plt.title(f'{fName_list[index]} Efficiency')
    # plt.legend(['Measurement', 'Model'])
    # plt.show(block=False)

    ## Fit Harmonic Model
    # Important! Data comes in with even and odd harmonics, but we typically want
    # only odd harmonics for surface fitting. We also may want to limit the maximum
    # harmonic present in the model, as shown here.

    # h = convData['harmonics']['h']
    # hMask = (np.mod(h, 2) > 0) & (h <= hMax)

    # h = h[hMask]
    # Imeas = convData['harmonics']['I'][hMask]
    # Imag = convData['harmonics']['Imag'][hMask]
    # Iarg = convData['harmonics']['Iarg'][hMask]
    # P1 = convData['harmonics']['P1'][hMask]

    # X, Y, Z_mag, Z_arg = empirical_harmonic_model(Imeas, h, P1, Inom, Pnom)


    # # Plot: Magnitude
    # fig = plt.figure(3)
    # ax = fig.add_subplot(111, projection='3d')
    # ax.plot_surface(X, Y * Pnom, Z_mag * Inom, alpha=0.75, cmap='viridis')
    # ax.set_xlabel('h', fontsize=14)
    # ax.set_ylabel('$P_{AC}^{(1)}$', fontsize=14)
    # ax.set_zlabel('$|I^{(h)}|$', fontsize=14)
    # ax.set_title('Magnitude Model')
    # plt.show(block=False)

    # # Plot: Phase
    # fig = plt.figure(4)
    # ax = fig.add_subplot(111, projection='3d')
    # ax.plot_surface(X, Y * Pnom, Z_arg, alpha=0.75, cmap='viridis')
    # ax.set_xlabel('h', fontsize=14)
    # ax.set_ylabel('$P_{AC}^{(1)}$', fontsize=14)
    # ax.set_zlabel(r'$\angle I^{(h)}$', fontsize=14)
    # ax.set_title('Phase Model')
    # plt.show(block=False)

    # Save Output
    # Demonstrates how to save a .mat file compatible with BEEAM's empirical AC/DC
    # converter model.

    # Filename

    fName = fName_list[index]
    data_dict = {"alpha":alpha,
                "beta":beta,
                "gamma":gamma}

    print(f"Coefficients for {fName_list[index]}: {data_dict}")
    
    #print(data_dict)
    #plt.show()

    #savemat(f"{fName_list[index]}.mat", data_dict)
    #index += 1
    #np.savez(fName[index], alpha=alpha, beta=beta, gamma=gamma)