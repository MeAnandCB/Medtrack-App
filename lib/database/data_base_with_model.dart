//doctors data model
class Doctor {
  int id;
  String? image;
  String? name;
  String? qualification;
  String? designation;
  int? yearsOfExperience;
  int? visitedPatientCount;
  double? ratingOutOf5;
  double? consultationFee;

  Doctor({
    required this.id,
    this.image,
    this.name,
    this.qualification,
    this.designation,
    this.yearsOfExperience,
    this.visitedPatientCount,
    this.ratingOutOf5,
    this.consultationFee,
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
    this.department,
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
          name: "DR. Nabil Ahamed Salim P",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 500,
          ratingOutOf5: 4.9,
          consultationFee: 75.0,
        ),
        Doctor(
          id: 2,
          image: "assets/images/doctors/genaral_medicine/2.jpeg",
          name: "DR. K M Mathew",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 80.0,
        ),
        Doctor(
          id: 3,
          image: "assets/images/doctors/genaral_medicine/10.png",
          name: "DR. Rachana Babu A",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 550,
          ratingOutOf5: 4.7,
          consultationFee: 70.0,
        ),
        Doctor(
          id: 4,
          image: "assets/images/doctors/genaral_medicine/3.jpeg",
          name: "DR. Anup R Warrier(M)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 450,
          ratingOutOf5: 4.6,
          consultationFee: 60.0,
        ),
        Doctor(
          id: 5,
          image: "assets/images/doctors/genaral_medicine/4.jpeg",
          name: "DR. Arun Wilson(M)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 700,
          ratingOutOf5: 4.9,
          consultationFee: 85.0,
        ),
        Doctor(
          id: 6,
          image: "assets/images/doctors/genaral_medicine/5.jpeg",
          name: "DR. Sherry Peter(M)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 800,
          ratingOutOf5: 4.9,
          consultationFee: 90.0,
        ),
        Doctor(
          id: 7,
          image: "assets/images/doctors/genaral_medicine/6.jpeg",
          name: "DR. Latha P Rao(F)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 400,
          ratingOutOf5: 4.7,
          consultationFee: 75.0,
        ),
        Doctor(
          id: 8,
          image: "assets/images/doctors/genaral_medicine/7.jpeg",
          name: "DR. Suma Menon N(F)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 550,
          ratingOutOf5: 4.8,
          consultationFee: 80.0,
        ),
        Doctor(
          id: 9,
          image: "assets/images/doctors/genaral_medicine/8.jpeg",
          name: "DR. Jijo Paul(M)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 650,
          ratingOutOf5: 4.9,
          consultationFee: 85.0,
        ),
        Doctor(
          id: 10,
          image: "assets/images/doctors/genaral_medicine/9.jpeg",
          name: "DR. Zachariah T Zachariah(M)",
          qualification: "MBBS, MD",
          designation: "General Practitioner",
          yearsOfExperience: 18,
          visitedPatientCount: 750,
          ratingOutOf5: 4.9,
          consultationFee: 90.0,
        ),

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
          image:
              "assets/images/doctors/genaral_medicine_department/oncology.png",
          name: "Dr. Susan Miller",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 18,
          visitedPatientCount: 400,
          ratingOutOf5: 4.9,
          consultationFee: 80,
        ),
        Doctor(
          id: 14,
          image:
              "assets/images/doctors/genaral_medicine_department/oncology.png",
          name: "Dr. Mark Anderson",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 20,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 85,
        ),
        Doctor(
          id: 15,
          image:
              "assets/images/doctors/genaral_medicine_department/oncology.png",
          name: "Dr. Emily Davis",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 15,
          visitedPatientCount: 350,
          ratingOutOf5: 4.7,
          consultationFee: 75,
        ),
        Doctor(
          id: 16,
          image:
              "assets/images/doctors/genaral_medicine_department/oncology.png",
          name: "Dr. Robert Clark",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 22,
          visitedPatientCount: 700,
          ratingOutOf5: 4.9,
          consultationFee: 90,
        ),
        Doctor(
          id: 17,
          image:
              "assets/images/doctors/genaral_medicine_department/oncology.png",
          name: "Dr. Sarah Turner",
          qualification: "MBBS, MD, FACP",
          designation: "Oncologist",
          yearsOfExperience: 19,
          visitedPatientCount: 550,
          ratingOutOf5: 4.8,
          consultationFee: 82,
        ),
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
          image:
              "assets/images/doctors/genaral_medicine_department/surgery.png",
          name: "Dr. John Smith",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 15,
          visitedPatientCount: 300,
          ratingOutOf5: 4.7,
          consultationFee: 90,
        ),
        Doctor(
          id: 19,
          image:
              "assets/images/doctors/genaral_medicine_department/surgery.png",
          name: "Dr. Linda Davis",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 18,
          visitedPatientCount: 450,
          ratingOutOf5: 4.9,
          consultationFee: 95,
        ),
        Doctor(
          id: 20,
          image:
              "assets/images/doctors/genaral_medicine_department/surgery.png",
          name: "Dr. Michael Johnson",
          qualification: "MBBS, MS, FACS",
          designation: "General Surgeon",
          yearsOfExperience: 20,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 85,
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
          image:
              "assets/images/doctors/genaral_medicine_department/emergency.png",
          name: "Dr. Mark Wilson",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 12,
          visitedPatientCount: 250,
          ratingOutOf5: 4.5,
          consultationFee: 75,
        ),
        Doctor(
          id: 23,
          image:
              "assets/images/doctors/genaral_medicine_department/emergency.png",
          name: "Dr. Sarah Adams",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 14,
          visitedPatientCount: 280,
          ratingOutOf5: 4.6,
          consultationFee: 80,
        ),
        Doctor(
          id: 24,
          image:
              "assets/images/doctors/genaral_medicine_department/emergency.png",
          name: "Dr. James Brown",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 16,
          visitedPatientCount: 300,
          ratingOutOf5: 4.7,
          consultationFee: 85,
        ),
        Doctor(
          id: 25,
          image:
              "assets/images/doctors/genaral_medicine_department/emergency.png",
          name: "Dr. Emily Smith",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 18,
          visitedPatientCount: 320,
          ratingOutOf5: 4.8,
          consultationFee: 90,
        ),
        Doctor(
          id: 26,
          image:
              "assets/images/doctors/genaral_medicine_department/emergency.png",
          name: "Dr. John Turner",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 10,
          visitedPatientCount: 220,
          ratingOutOf5: 4.4,
          consultationFee: 70,
        ),
        Doctor(
          id: 27,
          image:
              "assets/images/doctors/genaral_medicine_department/emergency.png",
          name: "Dr. Linda Davis",
          qualification: "MBBS, MD, EMA",
          designation: "Emergency Physician",
          yearsOfExperience: 13,
          visitedPatientCount: 260,
          ratingOutOf5: 4.6,
          consultationFee: 78,
        ),
        // Add more doctors for this department
      ],
    ),

    //Neurology Department
    Department(
      id: 5,
      image:
          "assets/images/doctors/genaral_medicine_department/gastroenterology.png",
      department: "Neurology Department",
      doctors: [
        Doctor(
          id: 28,
          image:
              "assets/images/doctors/genaral_medicine_department/neurology.png",
          name: "Dr. Alex Turner",
          qualification: "MBBS, MD, DM",
          designation: "Neurologist",
          yearsOfExperience: 14,
          visitedPatientCount: 350,
          ratingOutOf5: 4.8,
          consultationFee: 95,
        ),
        Doctor(
          id: 29,
          image:
              "assets/images/doctors/genaral_medicine_department/neurology.png",
          name: "Dr. Sarah Johnson",
          qualification: "MBBS, MD, DM",
          designation: "Neurologist",
          yearsOfExperience: 12,
          visitedPatientCount: 300,
          ratingOutOf5: 4.7,
          consultationFee: 90,
        ),
        // Add more doctors for this department
      ],
    ),
    //Cardiology Department
    Department(
      id: 6,
      image: "assets/images/doctors/genaral_medicine_department/obstetrics.png",
      department: "Cardiology Department",
      doctors: [
        Doctor(
          id: 30,
          image:
              "assets/images/doctors/genaral_medicine_department/cardiology.png",
          name: "Dr. John Anderson",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 18,
          visitedPatientCount: 500,
          ratingOutOf5: 4.9,
          consultationFee: 80,
        ),
        Doctor(
          id: 31,
          image:
              "assets/images/doctors/genaral_medicine_department/cardiology.png",
          name: "Dr. Emily Smith",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 20,
          visitedPatientCount: 700,
          ratingOutOf5: 4.8,
          consultationFee: 85,
        ),
        Doctor(
          id: 32,
          image:
              "assets/images/doctors/genaral_medicine_department/cardiology.png",
          name: "Dr. Michael Turner",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 16,
          visitedPatientCount: 550,
          ratingOutOf5: 4.7,
          consultationFee: 75,
        ),
        Doctor(
          id: 33,
          image:
              "assets/images/doctors/genaral_medicine_department/cardiology.png",
          name: "Dr. Sarah Davis",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 22,
          visitedPatientCount: 800,
          ratingOutOf5: 4.9,
          consultationFee: 90,
        ),
        Doctor(
          id: 34,
          image:
              "assets/images/doctors/genaral_medicine_department/cardiology.png",
          name: "Dr. Robert Johnson",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 19,
          visitedPatientCount: 600,
          ratingOutOf5: 4.8,
          consultationFee: 82,
        ),
        Doctor(
          id: 35,
          image:
              "assets/images/doctors/genaral_medicine_department/cardiology.png",
          name: "Dr. Linda Turner",
          qualification: "MBBS, MD, FACC",
          designation: "Cardiologist",
          yearsOfExperience: 21,
          visitedPatientCount: 750,
          ratingOutOf5: 4.6,
          consultationFee: 78,
        ),
        // Add more doctors for this department
      ],
    ),
    //Pediatrics Department
    Department(
      id: 7,
      image:
          "assets/images/doctors/genaral_medicine_department/orthopedics.png",
      department: "Pediatrics Department",
      doctors: [
        Doctor(
          id: 36,
          image:
              "assets/images/doctors/genaral_medicine_department/pediatrics.png",
          name: "Dr. Sarah Johnson",
          qualification: "MBBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 15,
          visitedPatientCount: 600,
          ratingOutOf5: 4.9,
          consultationFee: 70,
        ),
        Doctor(
          id: 37,
          image:
              "assets/images/doctors/genaral_medicine_department/pediatrics.png",
          name: "Dr. Emily Turner",
          qualification: "MBBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 18,
          visitedPatientCount: 750,
          ratingOutOf5: 4.8,
          consultationFee: 75,
        ),
        Doctor(
          id: 38,
          image:
              "assets/images/doctors/genaral_medicine_department/pediatrics.png",
          name: "Dr. Michael Davis",
          qualification: "MBBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 16,
          visitedPatientCount: 650,
          ratingOutOf5: 4.7,
          consultationFee: 72,
        ),
        Doctor(
          id: 39,
          image:
              "assets/images/doctors/genaral_medicine_department/pediatrics.png",
          name: "Dr. Linda Smith",
          qualification: "MBBS, MD",
          designation: "Pediatrician",
          yearsOfExperience: 20,
          visitedPatientCount: 800,
          ratingOutOf5: 4.9,
          consultationFee: 80,
        ),
      ],
    ),
    Department(
      id: 8,
      image: "assets/images/doctors/genaral_medicine_department/pediatrics.png",
      department: "Dermatology Department",
      doctors: [
        Doctor(
          id: 40,
          image:
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
          image:
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
          image:
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
          image:
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
              "assets/images/doctors/genaral_medicine_department/dermatology.png",
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
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. Emily Turner",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 14,
          visitedPatientCount: 600,
          ratingOutOf5: 4.9,
          consultationFee: 90,
        ),
        Doctor(
          id: 48,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. Sarah Johnson",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 16,
          visitedPatientCount: 750,
          ratingOutOf5: 4.8,
          consultationFee: 95,
        ),
        Doctor(
          id: 49,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. Linda Davis",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 12,
          visitedPatientCount: 480,
          ratingOutOf5: 4.7,
          consultationFee: 85,
        ),
        Doctor(
          id: 50,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. Michael Smith",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 18,
          visitedPatientCount: 620,
          ratingOutOf5: 4.9,
          consultationFee: 100,
        ),
        Doctor(
          id: 51,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. Susan Turner",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 15,
          visitedPatientCount: 550,
          ratingOutOf5: 4.8,
          consultationFee: 92,
        ),
        Doctor(
          id: 52,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. James Davis",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 20,
          visitedPatientCount: 700,
          ratingOutOf5: 4.7,
          consultationFee: 88,
        ),
        Doctor(
          id: 53,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. John Anderson",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 13,
          visitedPatientCount: 520,
          ratingOutOf5: 4.6,
          consultationFee: 87,
        ),
        Doctor(
          id: 54,
          image:
              "assets/images/doctors/genaral_medicine_department/gynecology.png",
          name: "Dr. Robert Turner",
          qualification: "MBBS, MD, FACOG",
          designation: "Gynecologist",
          yearsOfExperience: 17,
          visitedPatientCount: 670,
          ratingOutOf5: 4.8,
          consultationFee: 91,
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
          image:
              "assets/images/doctors/genaral_medicine_department/orthopedics.png",
          name: "Dr. Mark Turner",
          qualification: "MBBS, MS, DNB",
          designation: "Orthopedic Surgeon",
          yearsOfExperience: 15,
          visitedPatientCount: 400,
          ratingOutOf5: 4.7,
          consultationFee: 90,
        ),
        Doctor(
          id: 56,
          image:
              "assets/images/doctors/genaral_medicine_department/orthopedics.png",
          name: "Dr. Sarah Johnson",
          qualification: "MBBS, MS, DNB",
          designation: "Orthopedic Surgeon",
          yearsOfExperience: 18,
          visitedPatientCount: 500,
          ratingOutOf5: 4.8,
          consultationFee: 95,
        ),
        Doctor(
          id: 57,
          image:
              "assets/images/doctors/genaral_medicine_department/orthopedics.png",
          name: "Dr. Emily Davis",
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
              "assets/images/doctors/genaral_medicine_department/radiology.png",
          name: "Dr. Jennifer Turner",
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
              "assets/images/doctors/genaral_medicine_department/radiology.png",
          name: "Dr. Michael Johnson",
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
}
