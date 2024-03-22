//doctors data model

class Doctor {
  int id;
  String? image;
  String name;
  String qualification;
  String designation;
  int? yearsOfExperience;
  int? visitedPatientCount;
  double? ratingOutOf5;
  double consultationFee;

  Doctor({
    required this.id,
    this.image,
    required this.name,
    required this.qualification,
    required this.designation,
    this.yearsOfExperience,
    this.visitedPatientCount,
    this.ratingOutOf5,
    required this.consultationFee,
  });
}

//  department data model
class Department {
  int id;
  String? image;
  String? department;
  String? name;
  List<Doctor> doctors;

  Department({
    required this.id,
    this.image,
    required this.department,
    this.name,
    required this.doctors,
  });
}

class ModelDB {
  // General Medicine Department
  static List<Department> departmentsData = [
    Department(
      id: 0,
      image: "assets/images/doctors/genaral_medicine/1.png",
      department: "General Medicine",
      doctors: [
        Doctor(
          id: 1,
          image: "assets/images/doctors/genaral_medicine/1.png",
          name: "DR. Sreenivasan P",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 8,
          visitedPatientCount: 500,
          ratingOutOf5: 4.9,
          consultationFee: 200.0,
        ),
        Doctor(
          id: 2,
          image: "assets/images/doctors/genaral_medicine/2.jpeg",
          name: "DR. K M Mathew",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 12,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 250.0,
        ),
        Doctor(
          id: 3,
          image: "assets/images/doctors/genaral_medicine/10.png",
          name: "DR. Rachana Babu A",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 10,
          visitedPatientCount: 550,
          ratingOutOf5: 4.7,
          consultationFee: 180.0,
        ),
        Doctor(
          id: 4,
          image: "assets/images/doctors/genaral_medicine/3.jpeg",
          name: "DR. Anup R Warrier",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 7,
          visitedPatientCount: 450,
          ratingOutOf5: 4.6,
          consultationFee: 170.0,
        ),
        Doctor(
          id: 5,
          image: "assets/images/doctors/genaral_medicine/4.jpeg",
          name: "DR. Arun Wilson",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 9,
          visitedPatientCount: 700,
          ratingOutOf5: 4.9,
          consultationFee: 260.0,
        ),
        Doctor(
          id: 6,
          image: "assets/images/doctors/genaral_medicine/5.jpeg",
          name: "DR. Sherry Peter",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 5,
          visitedPatientCount: 800,
          ratingOutOf5: 4.9,
          consultationFee: 210.0,
        ),
        Doctor(
          id: 7,
          image: "assets/images/doctors/genaral_medicine/6.jpeg",
          name: "DR. Latha P Rao",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 14,
          visitedPatientCount: 400,
          ratingOutOf5: 4.7,
          consultationFee: 280.0,
        ),
        Doctor(
          id: 8,
          image: "assets/images/doctors/genaral_medicine/7.jpeg",
          name: "DR. Suma Menon N",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 6,
          visitedPatientCount: 550,
          ratingOutOf5: 4.8,
          consultationFee: 190.0,
        ),
        Doctor(
          id: 9,
          image: "assets/images/doctors/genaral_medicine/8.jpeg",
          name: "DR. Jijo Paul",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 13,
          visitedPatientCount: 650,
          ratingOutOf5: 4.9,
          consultationFee: 270.0,
        ),
        Doctor(
          id: 10,
          image: "assets/images/doctors/genaral_medicine/9.jpeg",
          name: "DR. Zachariah T Zachariah",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 11,
          visitedPatientCount: 750,
          ratingOutOf5: 4.9,
          consultationFee: 230.0,
        )

        // Add more doctors for this department
      ],
    ),

    // General Oncology Department
    Department(
      id: 2,
      image: "assets/images/doctors/genaral_medicine_department/cardiology.png",
      department: "Oncology Department",
      doctors: [
        Doctor(
          id: 13,
          image: "assets/images/doctors/oncology/6.jpg",
          name: "Dr. Ananya Nair",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 8,
          visitedPatientCount: 400,
          ratingOutOf5: 4.9,
          consultationFee: 200.0,
        ),
        Doctor(
          id: 14,
          image: "assets/images/doctors/oncology/1.jpg",
          name: "Dr. Rajat Menon",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 12,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 250.0,
        ),
        Doctor(
          id: 15,
          image: "assets/images/doctors/oncology/4.jpg",
          name: "Dr. Priya Kumar",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 10,
          visitedPatientCount: 350,
          ratingOutOf5: 4.7,
          consultationFee: 180.0,
        ),
        Doctor(
          id: 16,
          image: "assets/images/doctors/oncology/2.png",
          name: "Dr. Akshay Pillai",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 7,
          visitedPatientCount: 700,
          ratingOutOf5: 4.9,
          consultationFee: 170.0,
        ),
        Doctor(
          id: 17,
          image: "assets/images/doctors/oncology/7.jpg",
          name: "Dr. Neha Krishnan",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 9,
          visitedPatientCount: 550,
          ratingOutOf5: 4.8,
          consultationFee: 260.0,
        )

        // Add more doctors for this department
      ],
    ),

    // Surgery Department
    Department(
      id: 3,
      image:
          "assets/images/doctors/genaral_medicine_department/dermatology.png",
      department: "Surgery Department",
      doctors: [
        Doctor(
          id: 18,
          image: "assets/images/doctors/surgery/doctor1 (14).jpeg",
          name: "Dr. Aravind Murali",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 15,
          visitedPatientCount: 300,
          ratingOutOf5: 4.7,
          consultationFee: 200,
        ),
        Doctor(
          id: 19,
          image: "assets/images/doctors/surgery/doctor1 (1).jpeg",
          name: "Dr. Linda Davis",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 18,
          visitedPatientCount: 450,
          ratingOutOf5: 4.9,
          consultationFee: 300,
        ),
        Doctor(
          id: 20,
          image: "assets/images/doctors/surgery/doctor1 (102).jpeg",
          name: "Dr. Michael Johnson",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 20,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 250,
        ),

        // Add more doctors for this department
      ],
    ),
    // Emergency Department
    Department(
      id: 4,
      image: "assets/images/doctors/genaral_medicine_department/ent.png",
      department: "Emergency Department",
      doctors: [
        Doctor(
          id: 22,
          image: "assets/images/doctors/emergenct_department/doctor1 (69).jpeg",
          name: "Dr. Mark Wilson",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 12,
          visitedPatientCount: 250,
          ratingOutOf5: 4.5,
          consultationFee: 250,
        ),
        Doctor(
          id: 23,
          image: "assets/images/doctors/emergenct_department/doctor1 (82).jpeg",
          name: "Dr. Sarah Adams",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 14,
          visitedPatientCount: 280,
          ratingOutOf5: 4.6,
          consultationFee: 280,
        ),

        // Add more doctors for this department
      ],
    ),
    //Cardiology Department
    Department(
      id: 5,
      image:
          "assets/images/doctors/genaral_medicine_department/gastroenterology.png",
      department: "Cardiology Department",
      doctors: [
        Doctor(
          id: 1,
          image: "assets/images/doctors/neurology_department/doctor1 (44).jpeg",
          name: "DR.Durgapoorna",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 8, // Updated experience to be between 2 and 10
          visitedPatientCount: 0,
          ratingOutOf5: 4.9,
          consultationFee: 150.0,
        ),
        Doctor(
          id: 2,
          image: "assets/images/doctors/neurology_department/doctor1 (90).jpeg",
          name: "DR.Lijiya Pushpan",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 5, // Updated experience to be between 2 and 10
          visitedPatientCount: 0,
          ratingOutOf5: 4.7,
          consultationFee: 175.0,
        ),
        Doctor(
          id: 3,
          image: "assets/images/doctors/neurology_department/doctor1 (42).jpeg",
          name: "DR.Geetha Mammayil",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 7, // Updated experience to be between 2 and 10
          visitedPatientCount: 0,
          ratingOutOf5: 4.8,
          consultationFee: 200.0,
        ),
        Doctor(
          id: 4,
          image: "assets/images/doctors/neurology_department/doctor1 (54).jpeg",
          name: "DR.Shyam Gopal V",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 4, // Updated experience to be between 2 and 10
          visitedPatientCount: 0,
          ratingOutOf5: 4.6,
          consultationFee: 225.0,
        ),
        Doctor(
          id: 5,
          image: "assets/images/doctors/neurology_department/doctor1 (52).jpeg",
          name: "DR.Reji Paul",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 6, // Updated experience to be between 2 and 10
          visitedPatientCount: 0,
          ratingOutOf5: 4.5,
          consultationFee: 250.0,
        ),
        Doctor(
          id: 6,
          image: "assets/images/doctors/neurology_department/doctor1 (74).jpeg",
          name: "DR.Vijay Jayakrishnan",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 3, // Updated experience to be between 2 and 10
          visitedPatientCount: 0,
          ratingOutOf5: 4.9,
          consultationFee: 275.0,
        ),
        Doctor(
          id: 20,
          image: "assets/images/doctors/neurology_department/doctor1 (65).jpeg",
          name: "Dr. Michael Johnson",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 10, // Updated experience to be between 2 and 10
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 200.0,
        )
        // Add more doctors for this department
      ],
    ),
    Department(
        id: 6,
        image: "assets/images/doctors/genaral_medicine_department/ent.png",
        department: "Neurology Department",
        doctors: [
          Doctor(
            id: 22,
            image:
                "assets/images/doctors/neurology_department/doctor1 (40).jpeg",
            name: "Dr. Mark Wilson",
            qualification: "MBBS, MD, EMA",
            designation: "Neuro surgen",
            yearsOfExperience: 12,
            visitedPatientCount: 250,
            ratingOutOf5: 4.5,
            consultationFee: 250,
          ),
          Doctor(
            id: 23,
            image:
                "assets/images/doctors/neurology_department/doctor1 (41).jpeg",
            name: "Dr. Sarah Adams",
            qualification: "MBBS, MD, EMA",
            designation: "Neuro surgen",
            yearsOfExperience: 14,
            visitedPatientCount: 280,
            ratingOutOf5: 4.6,
            consultationFee: 280,
          ),
        ]),
    //Pediatrics Department
    Department(
      id: 7,
      image:
          "assets/images/doctors/genaral_medicine_department/orthopedics.png",
      department: "Pediatrics Department",
      doctors: [
        Doctor(
          id: 40,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (81).jpeg",
          name: "DR.Chithra Thomas",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 3, // Set the years of experience
          visitedPatientCount: 115,
          ratingOutOf5: 4.8, // Set a fixed rating
          consultationFee: 220, // Set a fixed consultation fee
        ),
        Doctor(
          id: 41,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (45).jpeg",
          name: "DR.Rajasree",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 6, // Set the years of experience
          visitedPatientCount: 365,
          ratingOutOf5: 4.7, // Set a fixed rating
          consultationFee: 240, // Set a fixed consultation fee
        ),
        Doctor(
          id: 42,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (80).jpeg",
          name: "DR.Parvathy L",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 4, // Set the years of experience
          visitedPatientCount: 654,
          ratingOutOf5: 4.9, // Set a fixed rating
          consultationFee: 260, // Set a fixed consultation fee
        ),
        Doctor(
          id: 43,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (10).jpeg",
          name: "DR.Prasant Narayanan",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 5, // Set the years of experience
          visitedPatientCount: 433,
          ratingOutOf5: 4.8, // Set a fixed rating
          consultationFee: 280, // Set a fixed consultation fee
        ),
        Doctor(
          id: 44,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (12).jpeg",
          name: "DR.Anoob Thomas",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 2, // Set the years of experience
          visitedPatientCount: 743,
          ratingOutOf5: 4.7, // Set a fixed rating
          consultationFee: 220, // Set a fixed consultation fee
        ),
        Doctor(
          id: 45,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (13).jpeg",
          name: "DR.Dinesh D Menon",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 7, // Set the years of experience
          visitedPatientCount: 430,
          ratingOutOf5: 4.8, // Set a fixed rating
          consultationFee: 250, // Set a fixed consultation fee
        ),
        Doctor(
          id: 46,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (14).jpeg",
          name: "DR.Narayanan unni",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 8, // Set the years of experience
          visitedPatientCount: 433,
          ratingOutOf5: 4.9, // Set a fixed rating
          consultationFee: 280, // Set a fixed consultation fee
        ),
        Doctor(
          id: 47,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (31).jpeg",
          name: "DR.Ashok Rijhwani",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 10, // Set the years of experience
          visitedPatientCount: 232,
          ratingOutOf5: 5.0, // Set a fixed rating
          consultationFee: 300, // Set a fixed consultation fee
        ),
        Doctor(
          id: 48,
          image: "assets/images/doctors/pediatrics_department/doctor1 (9).jpeg",
          name: "DR.Bijoy Jose",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 9, // Set the years of experience
          visitedPatientCount: 221,
          ratingOutOf5: 4.9, // Set a fixed rating
          consultationFee: 290, // Set a fixed consultation fee
        ),
        Doctor(
          id: 49,
          image:
              "assets/images/doctors/pediatrics_department/doctor1 (11).jpeg",
          name: "DR.Davidson Devasia",
          qualification: "MMBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 3, // Set the years of experience
          visitedPatientCount: 452,
          ratingOutOf5: 4.7, // Set a fixed rating
          consultationFee: 220, // Set a fixed consultation fee
        ),
      ],
    ),

    // dermatology Department
    Department(
      id: 8,
      image: "",
      department: "Dermatology Department",
      doctors: [
        Doctor(
          id: 40,
          image: "assets/images/doctors/dematology_department/preethy.webp",
          name: "Dr. Emily Turner",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 12,
          visitedPatientCount: 400,
          ratingOutOf5: 4.7,
          consultationFee: 90,
        ),
        Doctor(
          id: 41,
          image: "assets/images/doctors/dematology_department/pavithran.webp",
          name: "Dr. Sarah Johnson",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 14,
          visitedPatientCount: 450,
          ratingOutOf5: 4.8,
          consultationFee: 95,
        ),
        Doctor(
          id: 42,
          image: "assets/images/doctors/dematology_department/rakesh.webp",
          name: "Dr. Michael Davis",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 10,
          visitedPatientCount: 350,
          ratingOutOf5: 4.6,
          consultationFee: 85,
        ),
        Doctor(
          id: 43,
          image: "assets/images/doctors/dematology_department/mubeena.webp",
          name: "Dr. Linda Smith",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 16,
          visitedPatientCount: 500,
          ratingOutOf5: 4.9,
          consultationFee: 100,
        ),
        Doctor(
          id: 44,
          image:
              "assets/images/doctors/dematology_department/doctor1 (35).jpeg",
          name: "Dr. John Anderson",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 13,
          visitedPatientCount: 420,
          ratingOutOf5: 4.7,
          consultationFee: 88,
        ),
        Doctor(
          id: 45,
          image:
              "assets/images/doctors/dematology_department/Dr. Sreedevi S Nair.jpeg.webp",
          name: "Dr. Susan Turner",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 15,
          visitedPatientCount: 480,
          ratingOutOf5: 4.8,
          consultationFee: 92,
        ),
        Doctor(
          id: 46,
          image:
              "assets/images/doctors/dematology_department/doctor1 (36).jpeg",
          name: "Dr. James Davis",
          qualification: "MBBS, MD",
          designation: "Dermatologist",
          yearsOfExperience: 11,
          visitedPatientCount: 380,
          ratingOutOf5: 4.6,
          consultationFee: 87,
        ),
      ],
    ),
    //Gynecology Department
    Department(
      id: 9,
      image: "assets/images/doctors/genaral_medicine_department/psychiatry.png",
      department: "Gynecology Department",
      doctors: [
        Doctor(
          id: 47,
          image:
              "assets/images/doctors/gynecology_department/Dr. Sudha Krishnanunni.jpeg.webp",
          name: "Dr. Priya Nair",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 14,
          visitedPatientCount: 600,
          ratingOutOf5: 4.9,
          consultationFee: 150,
        ),
        Doctor(
          id: 48,
          image:
              "assets/images/doctors/gynecology_department/Dr. Roshni Gangan.jpeg.webp",
          name: "Dr. Sreelakshmi Menon",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 16,
          visitedPatientCount: 750,
          ratingOutOf5: 4.8,
          consultationFee: 150,
        ),
        Doctor(
          id: 49,
          image: "assets/images/doctors/gynecology_department/dr.jpeg.webp",
          name: "Dr. Lekshmi Suresh",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 12,
          visitedPatientCount: 480,
          ratingOutOf5: 4.7,
          consultationFee: 150,
        ),
        Doctor(
          id: 51,
          image:
              "assets/images/doctors/gynecology_department/Model (1).jpg.webp",
          name: "Dr. Sujatha Sankar",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 15,
          visitedPatientCount: 550,
          ratingOutOf5: 4.8,
          consultationFee: 150,
        ),
      ],
    ),
    //Orthopedics Department
    Department(
      id: 10,
      image: "assets/images/doctors/genaral_medicine_department/surgery.png",
      department: "Orthopedics Department",
      doctors: [
        Doctor(
          id: 55,
          image: "assets/images/doctors/ortho_department/1.webp",
          name: "Dr. Remesh Bhasi",
          qualification: "MBBS, MS, DNB",
          designation: "Orthopedic Surgeon",
          yearsOfExperience: 15,
          visitedPatientCount: 400,
          ratingOutOf5: 4.7,
          consultationFee: 90,
        ),
        Doctor(
          id: 56,
          image: "assets/images/doctors/ortho_department/2.webp",
          name: "Dr. Aabu Alex Thomas",
          qualification: "MBBS, MS, DNB",
          designation: "Orthopedic Surgeon",
          yearsOfExperience: 18,
          visitedPatientCount: 500,
          ratingOutOf5: 4.8,
          consultationFee: 95,
        ),
        Doctor(
          id: 57,
          image: "assets/images/doctors/ortho_department/3.webp",
          name: "Dr. Aabu Alex Thomas",
          qualification: "MBBS, MS, DNB",
          designation: "Orthopedic Surgeon",
          yearsOfExperience: 12,
          visitedPatientCount: 350,
          ratingOutOf5: 4.6,
          consultationFee: 85,
        ),
      ],
    ),

    // Radiology Department
    Department(
      id: 11,
      image: "assets/images/doctors/genaral_medicine_department/surgery.png",
      department: "Radiology Department",
      doctors: [
        Doctor(
          id: 58,
          image:
              "assets/images/doctors/radiology-department/Dr. Asha_.jpg.webp",
          name: "Dr. Asha Kishore",
          qualification: "MBBS, MD, Radiologist",
          designation: "Radiologist",
          yearsOfExperience: 15,
          visitedPatientCount: 300,
          ratingOutOf5: 4.8,
          consultationFee: 100,
        ),
        Doctor(
          id: 59,
          image:
              "assets/images/doctors/radiology-department/Dr. Sandeep.jpg.webp",
          name: "Dr. Sandeep Padmanabhan",
          qualification: "MBBS, MD, Radiologist",
          designation: "Radiologist",
          yearsOfExperience: 18,
          visitedPatientCount: 400,
          ratingOutOf5: 4.9,
          consultationFee: 110,
        ),
      ],
    ),
  ];

  static List<Map<dynamic, dynamic>> myProfileData = [];
}
