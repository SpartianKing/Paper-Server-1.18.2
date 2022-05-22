###############################################
# Overclock
###############################################

if [[ ! $oc_volt == 0 ]]; then
  dialog --infobox "Overclocking your system..." 3 34 ; sleep 1
  datestamp=$(date +"%Y-%m-%d_%H-%M-%S")

  cp $configfile /boot/config-${datestamp}.txt

  # Replace existing overclock settings or add new ones if none exist

  /bin/sed -i -- "/over_voltage=/c\over_voltage=${oc_volt}" $configfile
  if ! grep -q "over_voltage=" $configfile; then
    echo "over_voltage=$oc_volt" >> $configfile
  fi

  /bin/sed -i -- "/arm_freq=/c\arm_freq=${oc_freq}" $configfile
  if ! grep -q "arm_freq=" $configfile; then
    echo "arm_freq=${oc_freq}" >> $configfile
  fi

  /bin/sed -i -- "/dtparam=audio=/c\dtparam=audio=off" $configfile
  if ! grep -q "dtparam=audio=" $configfile; then
    echo "dtparam=audio=" >> $configfile
  fi

fi

###############################################
# /Overclock
###############################################