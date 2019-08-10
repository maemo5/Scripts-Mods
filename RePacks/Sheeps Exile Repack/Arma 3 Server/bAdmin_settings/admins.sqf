// bAdmin Exile by Biabock

// Admin menu (U key) access levels

/*******************************************************
 Player UID examples :

	"1234567887654321", // Meatwad
	"8765432112345678", // Master Shake
	"1234876543211234", // Frylock
	"1337133713371337"  // Carl

 Important: The player UID must always be placed between
            double quotes (") and all lines need to have
            a comma (,) except the last one.
********************************************************/

//	Moderators
lowAdmins = compileFinal str
[
	// Put player UIDs here
];

//	High Administrators
highAdmins = compileFinal str
[
	// Put player UIDs here
];

//	Server Owners: access to everything
serverOwners = compileFinal str
[
	"76561198083039115", //Fallingsheep
	"76561198027539471", // Daz
	"76561198080973735", // Muffin
	"76561198119540941" // God
];
