class DatabaseImages {
  static List<Map> databaseImagesDepartment = [
    {
      "id": 1,
      "image": "assets/images/doctors_department/drug.png",
      "department": "General Medicine",
    },
    {
      "id": 2,
      "image": "assets/images/doctors_department/cancer.png",
      "department": "Oncology Department",
    },
    {
      "id": 3,
      "image": "assets/images/doctors_department/surgery.png",
      "department": "Surgery Department"
    },
    {
      "id": 4,
      "image": "assets/images/doctors_department/emergency.png",
      "department": "Emergency Department"
    },
    {
      "id": 5,
      "image": "assets/images/doctors_department/heart.png",
      "department": "Cardiology Department",
    },
    {
      "id": 6,
      "image": "assets/images/doctors_department/brain.png",
      "department": "Neurology Department",
    },
    {
      "id": 7,
      "image": "assets/images/doctors_department/pediatrics.png",
      "department": "Pediatrics Department"
    },
    {
      "id": 8,
      "image": "assets/images/doctors_department/skin.png",
      "department": "Dermatology Department"
    },
    {
      "id": 9,
      "image": "assets/images/doctors_department/maternity.png",
      "department": "Gynecology Department"
    },
    {
      "id": 10,
      "image": "assets/images/doctors_department/arthritis.png",
      "department": "Orthopedics Department"
    },
    {
      "id": 11,
      "image": "assets/images/doctors_department/x-ray.png",
      "department": "Radiology Department"
    },
  ];
//
// services

  static List<String> medicalConditions = [
    "Ano-rectal malformations",
    "Biliary atresia",
    "Choledochal cyst",
    "Congenital diaphragmatic hernia",
    "Duodenal, Jejunal, and Oesophageal atresia",
    "Cleft lip and palate",
    "Cystadenoma malformation of lung",
    "Excision of congenital lobar emphysema",
    "Hirschsprun’s disease",
    "Spina bifida",
    "Myelomeningocele",
    "Malrotation",
  ];

  static List<Map<String, dynamic>> doctorsClinic = [
    {
      'name': "Dr. P.P Aby MD Consulting Clinic",
      'specialty': "Family practice physician",
      'rating': 4
    },
    {
      'name': "Dr. Benny Thomas V Clinic",
      'specialty': "Medical clinic",
      'rating': 5
    },
    {
      'name': "Dr. K.N. Jaya's Skin Clinic",
      'specialty': "Skin care clinic",
      'rating': 3
    },
    {
      'name': "Dr. Prasad's Cosmetic & Skin Clinic",
      'specialty': "Occupational medical physician",
      'rating': 4
    },
    {
      'name': "Mery cross Cosmetic & Skin Clinic",
      'specialty': "Occupational medical physician",
      'rating': 3
    },
  ];
  static List<Map<String, dynamic>> clinics = [
    {'name': 'Mediqueen Pharma', 'specialty': 'Pharmacy', 'rating': 5},
    {
      'name': 'Mother Teresa Medical Stores',
      'specialty': 'Pharmacy',
      'rating': 4
    },
    {'name': 'Neethi Medical Store', 'specialty': 'Pharmacy', 'rating': 3},
    {
      'name': 'New CARE N CURE Medicals & Surgicals',
      'specialty': 'Pharmacy',
      'rating': 5
    },
    {'name': 'Alapatt Drug House', 'specialty': 'Pharmacy', 'rating': 2},
  ];
}
