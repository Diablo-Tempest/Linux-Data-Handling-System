choice=0
while true
do
	clear
	echo
	echo
	echo "+----------------------+"
	echo "| Data Handling System |"
	echo "+----------------------+"
	echo
	echo "1) Directory Management System"
	echo "2) File Management System"
	echo "3) Exit"
	echo
	read -p 'Enter Your Choice: ' choice
	clear

	case $choice in
	1)
		ch=0
		while true
		do
			clear
			echo
			echo
			echo "+----------------------+"
			echo "| Directory Management |"
			echo "+----------------------+"
			echo
			echo -e "Current Directory: \c"
			pwd
			echo
			echo "1) Create A New Directory"
			echo "2) Modify A Directory"
			echo "3) Navigate Into Directory"
			echo "4) Listing Directories"
			echo "5) Exit From Directory Management"
			echo
			read -p 'Enter Your Choice: ' ch
			clear

			case $ch in
			1)
				echo -e "Current Directory : \c"
				pwd
				echo
				echo "+-----------------------+"
				echo "| Creation Of Directory |"
				echo "+-----------------------+"
				echo
				read -p 'Enter The Name Of The Directory: ' name
				if [ -d $name ]
				then
					clear
					echo
					echo
					echo "+-----------------------+"
					echo "| Creation Of Directory |"
					echo "+-----------------------+"
					echo
					echo "Directory Already Exist"
					echo
					read -sp 'Press Enter To Continue: '
				else
					clear
					echo
					echo
					echo "+-----------------------+"
					echo "| Creation Of Directory |"
					echo "+-----------------------+"
					mkdir $name
					echo
					echo "Directory '$name' Has Been Created"
					echo
					read -sp 'Press Enter To Continue: '
				fi
			;;
			2)
				echo -e "Current Directory : \c"
				pwd
				echo
				echo "+---------------------------+"
				echo "| Modification Of Directory |"
				echo "+---------------------------+"
				echo
				read -p 'Enter The Directory Name To Be Modified: ' orgdir
				clear
				if [ -d $orgdir ]
				then
						echo
						echo
						echo "+---------------------------+"
						echo "| Modification Of Directory |"
						echo "+---------------------------+"
						echo
						echo "Directory '$orgdir' Selected"
						echo
						read -sp 'Press Enter To Continue: '
						clear
					while true
					do
						echo
						echo
						echo "+---------------------------+"
						echo "| Modification Of Directory |"
						echo "+---------------------------+"
						echo
						echo "1) Rename Directory '$orgdir'"
						echo "2) Copy Directory '$orgdir' To Another Directory"
						echo "3) Move Directory '$orgdir'"
						echo "4) Delete Directory '$orgdir'"
						echo "5) Change Directory '$orgdir' Permissions"
						echo "6) Exit From 'Modification Of Directory'"
						echo
						read -p 'Enter Your Choice: ' modch
						clear
						case $modch in
						1)
							echo -e "Current Directory : \c"
							pwd
							echo
							echo "+--------------------+"
							echo "| Rename A Directory |"
							echo "+--------------------+"
							echo
							read -p ' Enter A New Name for the directory: ' newname
							if [ -d $newname ]
							then
								echo
								echo
								echo "+--------------------+"
								echo "| Rename A Directory |"
								echo "+--------------------+"
								echo
								echo "Directory 'newname' Already Exist"
								echo
								read -sp 'Press Enter To Continue: '
								clear
							else
								echo
								echo
								echo "+--------------------+"
								echo "| Rename A Directory |"
								echo "+--------------------+"
								echo
								mv $orgdir $newname
								echo "Directory '$orgdir' Is Successfully Renamed To '$newname'"
								echo
								read -sp 'Press Enter To Continue: '
								clear
							fi


						;;
						2)
							echo -e "Current Directory : \c"
							pwd
							echo
							echo "+--------------------------------+"
							echo "| Copying A Directory To Another |"
							echo "+--------------------------------+"
							echo
							read -p 'Enter the target directory : ' target
							echo
							if [ -d $target ]
							then
								echo
								echo
								echo "+--------------------------------+"
								echo "| Copying A Directory To Another |"
								echo "+--------------------------------+"
								echo
								cp  -r $orgdir $target
								echo "Directory '$target' Is Copied To Directory '$target'"
								echo
								read -sp 'Press Enter To Continue: '
								clear
							else
								echo
								echo
								echo "+--------------------------------+"
								echo "| Copying A Directory To Another |"
								echo "+--------------------------------+"
								echo "Target Directory Doesn't Exist"
								echo
								read -sp 'Press Enter To Continue: '
							fi
						;;
						3)
							echo -e "Current Directory : \c"
							pwd
							echo
							echo "+--------------------+"
							echo "| Moving A Directory |"
							echo "+--------------------+"
							echo
							read -p 'Enter Target Directory : ' target
							if [ -d $target ]
							then
								echo
								echo
								echo "+--------------------+"
								echo "| Moving A Directory |"
								echo "+--------------------+"
								mv $orgdir $target
								echo
								echo "Directory '$orgdir' Is Moved To Directory '$target'"
								echo
								read -sp 'Press Enter To Continue: '
								clear
							else
								echo
								echo
								echo "+--------------------+"
								echo "| Moving A Directory |"
								echo "+--------------------+"
								echo
								echo "Directory '$target' Not Found"
								echo
								read -sp 'Press Enter To Continue: '
								clear
							fi
						;;
						4)
							echo -e "Current Directory : \c"
							pwd
							echo
							echo "+----------------------+"
							echo "| Deleting A Directory |"
							echo "+----------------------+"
							echo
							echo "Are You sure You Want To Delete Directory '$orgdir' ?"
							while true
							do
								read -p 'Press Y/y For Confirmation and N/n For Rejection: ' delch
								case $delch in
								y)
									rmdir $orgdir
									echo
									echo "Directory '$orgdir' Is Deleted"
									echo
									read -sp 'Press Enter To Continue: '
									break
								;;
								Y)
									rmdir $orgdir
									echo
									echo "Directory '$orgdir' Is Deleted"
									echo
									read -sp 'Press Enter To Continue: '
									break
								;;
								n)
									echo
									echo "Deleting Directory '$orgdir' Is Cancelled"
									echo
									read -sp 'Press Enter To COntinue: '
									break
								;;
								N)
									echo
									echo "Deleting Directory '$orgdir' Is Cancelled"
									echo
									read -sp 'Press Enter To Continue: '
									break
								;;
								*)
									echo
									echo "Invalid Input!!!"
									echo
									read -sp 'Press Enter To Continue: '
									clear
								;;
								esac
							done
						;;
						5)
							echo -e "Current Directory: \c"
							pwd
							echo "+------------------------------+"
							echo "| Change Directory Permissions |"
							echo "+------------------------------+"
							echo
							echo "+-------------------------------------------------------------------+"
							echo "|                           For Reference                           |"
							echo "|                           -------------                           |"
							echo "| Permission Code: Execute(x)--> 1 , Write(w) --> 2 , Read(r) --> 4 |"
							echo "+-------------------------------------------------------------------+"
							read -p 'Admin: ' admin
							read -p 'Group: ' group
							read -p 'Public: ' public
							chmod $admin$group$public $orgdir
							echo
							echo "Permission Of Directory '$orgdir' has Changed Successfully"
							echo
							read -sp 'Press Enter To Continue: '
							clear
						;;
						6)
							break
						;;
						*)
							echo
							echo "Invalid Input"
							echo
							read -sp 'Press Enter To Continue: '
							clear
						;;
						esac
					done

				else
					echo
					echo "Directory '$orgdir' Does Not Exist"
					echo
					read -sp 'Press Enter To Continue: '
					clear
				fi
			;;
			3)
					echo -e "Current Directory : \c"
					pwd
					echo
					while true
					do
						echo
						echo "+-----------------------------+"
						echo "| Navigation Of The Directory |"
						echo "+-----------------------------+"
						echo
						echo "1) Go To Parent Directory"
						echo "2) Navigate To Specific Directory"
						echo
						read -p 'Enter Your Choice: ' navch
						clear
						case $navch in
						1)
							echo -e "Previous Current Directory : \c"
							pwd
							echo
							echo "+--------------------------+"
							echo "| Parent Directory Engaged |"
							echo "+--------------------------+"
							echo
							cd ..
							echo -e "Updated Current Directory: \c"
							pwd
							echo
							read -sp 'Press Enter To Continue: '
							clear
							break
						;;
						2)
							clear
							echo -e "Current Directory : \c"
							pwd
							echo
							echo "+----------------------------------+"
							echo "| Navigation To Specific Directory |"
							echo "+----------------------------------+"
							read -p 'Enter The Directory Name: ' path
							cd $path
							echo
							echo -e "Updated Current Directory: \c"
							pwd
							echo
							read -sp 'Press Enter To Continue: '
							clear
							break
						;;
						*)
							echo "Invalid Input "
							read -sp 'Press Enter To Continue: '
							clear
							break
						;;
						esac
					done
			;;		
			4)
				echo -e "Current Directory : \c"
				pwd
				echo
				echo "+---------------------+"
				echo "| List Of Directories |"
				echo "+---------------------+"
				echo
				echo "1) List Of Directories"
				echo "2) List Of Directories And Their Details"
				echo
				read -p "Enter Your Choice: " lisch
				clear
				case $lisch in
				1)	
					echo -e "Current Directory : \c"
					pwd
					echo
					echo "+---------------------+"
					echo "| List Of Directories |"
					echo "+---------------------+"
					echo
					ls -d */
					echo
					read -sp 'Press Enter To Continue: '		
				;;
				2)
					echo -e "Current Directory : \c"
					pwd
					echo
					echo "+------------------------------+"
					echo "| Detailed List Of Directories |"
					echo "+------------------------------+"
					echo
					ls -d -al */
					echo
					read -sp 'Press Enter To Continue: '
				;;
				*)
					echo "Invalid Input!!!"
					echo
					read -sp 'Press Enter To Continue: '
				;;
				esac
			;;
			5)
				break
			;;
			*)
				echo "Invalid Input!!!"
				echo
				read -sp 'Press Enter To Continue: '
				clear
			;;
			esac
		done

	;;
	2)
		clear
		ch=0
		while true
		do
			clear
			echo
			echo "+------------------------+"
			echo "| File Management System |"
			echo "+------------------------+"
			echo
			echo -e "Current Directory : \c"
			pwd
			echo
			echo "1) Creation Of File"
			echo "2) Modification Of A File"
			echo "3) Listing Files"
			echo "4) Exit From File Management System"
			echo
			read -p 'Enter Your Choice: ' ch
			clear
			case $ch in
			1)
				echo
				read -p 'Enter The Name Of The File: ' file
				echo
				if [ -f $file ]
				then
					echo "File '$file' Already Exist"
					echo
					read -sp 'Press Enter To Continue: '
				else
					touch $file
					echo "File '$file' Is Created"
					echo
					read -sp 'Press Enter To Continue: '
				fi
			;;
			2)
				echo
				echo "+------------------------+"
				echo "| Modification Of A File |"
				echo "+------------------------+"
				echo
				read -p 'Enter The File To Be Modified: ' modfl
				echo
				if [ -f $modfl ]
				then
					echo "File '$modfl' Selected"
					echo
					read -sp 'Press Enter To Continue: '
					clear
					echo
					while true
					do
						echo
						echo "+------------------------+"
						echo "| Modification Of A File |"
						echo "+------------------------+"
						echo
						echo "1) Rename File '$modfl'"
						echo "2) Delete File '$modfl'"
						echo "3) Write/Rewrite In File '$modfl'"
						echo "4) Change File '$modfl' Permission"
						echo
						read -p 'Enter Your Choice: ' modch
						clear
						case $modch in
						1)
							echo
							read -p 'Enter New Name For The File: ' renm
							mv $modfl $renm
							echo "File Name Is Changed From '$modfl' To '$renm'"
							echo
							read -sp 'Press Enter To Continue: '
							clear
						;;
						2)
							echo
							rm $modfl
							echo "File '$modfl' Is Deleted"
							echo
							read -sp 'Press Enter To Continue: '
							break
						;;
						3)
							echo
							echo "+-----------------------------------+"
							echo "| Choose The Editor You Want To Use |"
							echo "+-----------------------------------+"
							echo
							echo "1) Nano"
							echo "2) Vim"
							echo "3) Leafpad"
							echo "4) Text Editor"
							echo
							read -sp 'Enter Your Choice: ' edt
							clear
							case $edt in
							1)
								echo
								nano $modfl
								echo "Nano Is Closed."
								echo
								read -sp 'Press Enter To Continue: '
								clear
							;;
							2)
								echo
								vim $modfl
								echo "Vim Is Now Closed."
								echo
								read -sp 'Press Enter To Continue: '
								clear
							;;
							*)
								echo
								echo "Invalid Input!!!"
								echo
								read -sp 'Press Enter To Continue: '
								clear
							;;
							esac
						;;
						4)
							echo
							echo "+-------------------------+"
							echo "| Change File Permissions |"
							echo "+-------------------------+"
							echo
							echo "+-------------------------------------------------------------------+"
							echo "|                           For Reference                           |"
							echo "|                           -------------                           |"
							echo "| Permission Code: Execute(x)--> 1 , Write(w) --> 2 , Read(r) --> 4 |"
							echo "+-------------------------------------------------------------------+"
							read -p 'Admin: ' admin
							read -p 'Group: ' group
							read -p 'Public: ' public
							chmod $admin$group$public $modfl
							echo
							echo "Permission Of File '$modfl' Has Changed Successfully"
							echo
							read -sp 'Press Enter To Continue: '
							clear

						;;
						*)
							echo
							echo "Invalid Input!!!"
							echo
							read -sp 'Press Enter To Continue: '
							clear
						;;
						esac
					done	

				else
					echo "Invalid File Name '$modfl'"
					echo
					read -sp 'Press Enter To Continue: '
					clear
				fi

			;;
			3)
				echo
				echo "+------------------+"
				echo "| Listing Of Files |"
				echo "+------------------+"
				echo
				echo "1) List Of Files"
				echo "2) Detailed List Of Files"
				echo
				read -sp 'Enter Your Choice: ' fisch
				clear
				case $fisch in
				1)
					echo
					echo "+---------------+"
					echo "| LIST OF FILES |"
					echo "+---------------+"
					echo
					ls
					echo
					read -sp 'Press Enter To Continue: '
				;;
				2)
					echo
					echo "+------------------------+"
					echo "| DETAILED LIST OF FILES |"
					echo "+------------------------+"
					echo
					ls -l
					echo
					read -sp 'Press Enter To Continue: '
				;;
				*)
					echo
					echo "Invalid Input!!!"
					echo
					read -sp 'Press Enter To Continue: '
				;;
				esac
			;;
			4)
				break
			;;
			*)
				echo "Invalid Input !!!"
				echo
				read -sp 'Press Enter To Continue: '
			;;
			esac
		done
	;;
	3)
		echo
		echo
		echo "+------------------------+"
		echo "| Data Management System |"
		echo "+------------------------+"
		echo
		echo "Thank You For Using Data Management System."
		echo
		read -sp 'Press Enter To Continue: '
		clear
		exit
	;;
	*)
		echo
		echo "Invalid Input!!!"
		echo
		read -sp 'Press Enter To Continue: '
	;;
	esac

done