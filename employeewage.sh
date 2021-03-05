#!/bin/bash -x

#constant
IS_FULLTIME=1
IS_PARTTIME=2
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20
MAX_HRS_IN_MONTH=100

#variable
totalWorkingDays=0
totalEmpHrs=0

function getWorkingHrs() {
    case $1 in
      $IS_FULLTIME)
         empHrs=8
      ;;
      $IS_PARTTIME)
           empHrs=4
      ;;
      *)
        empHrs=0
      ;;
   esac
   echo $empHrs
}


while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
   ((totalWorkingDays++))
   empcheck=$((RANDOM%3))
   empHrs=$( getWorkingHrs $empCheck )
   totalEmpHrs=$(($totalEmpHrs+$empHrs))

done

totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HR))
echo $totalSalary
