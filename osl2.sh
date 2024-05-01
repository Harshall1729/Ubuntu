echo "Enter Address book name: "
read fname

if[! -e "fname"]; then
touch "fname"
echo -e "Address Book Created...\n"
echo -e "ID\tname\tmob_no\tsalary">>"$fname"
else
echo -e "Address Book 'fname' already exist..\n"
fi
while true; do
echo -e "******ADDRESS BOOK******:\n"
echo -e "\t1. View Address Book"
echo -e "\t2. Insert an Element"
echo -e "\t3. Delete a record"
echo -e "\t4. Modify a record"
echo -e "\t5. Search a Record"
echo -e "\t6. Exit from Address Book"
echo -e "\t5. Enter your choice: "
read ch;

case $ch in
1) cat "$fname"
;;
2) echo -e "Enter employee ID: "
read eid
echo -e "Enter employee name: "
read ename
echo -e "Enter employee mobile number: "
read eno
echo -e "Enter employee salary: "
read esal
echo -e "$eid\t$ename\t$eno\t$esal">>"$fname"
;;
3) echo -e "Enter the Employee id to be deleted: "
read eid
if grep -qw "$eid" "$fname";
then 
grep -wv "$eid" "$fname">temp
mv temp "$fname"
echo -e "Record Deleted"
else
echo -e "Record does not exist"
fi
;;
4) echo -e "Enter the Employee id to be modified: "
read eid
if grep -qw "$eid" "$fname";
then 
grep -wv "$eid" "$fname">temp
mv temp "$fname"
echo -e "Enter Modified Record"
echo -e "Enter the employee id: "
read eid
echo -e "Enter the employee name: "
read ename
echo -e "Enter the employee mobile number :"
read eno;
echo -e "Enter the employee salary: "
read esal;
echo -e "$eid\t$ename\t$eno\t$esal">>"$fname"
else 
echo -e "Record does not exist"
fi
;;
5) echo -e "Enter the Employee id to be modified: "
read eid
if grep -qw "$eid" "$fname";
then 
grep -wv "$eid" "$fname">temp
echo -e "Record Found"
else
echo -e "record Does not exist"
fi
;;
6) echo -e "Thank You"
exit
;;
*)
echo -e "Please Enter Correct choices: "
;;
esac
done
