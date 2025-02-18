-- Relax FOREIGN KEY Constraints
SET FOREIGN_KEY_CHECKS = 0;

-- Insert 20 records into the FosterHomes table with Indian records

INSERT INTO FosterHomes (FosterHomeID, Name, Address, ContactPerson, ContactPhone, Capacity, CurrentOccupancy) VALUES
(1, 'Paws Paradise', '12 MG Road, Bengaluru, Karnataka', 'Arjun Reddy', '9876543210', 15, 10),
(2, 'Furry Friends Shelter', '45 Link Road, Mumbai, Maharashtra', 'Meera Desai', '9123456789', 20, 12),
(3, 'Hope for Paws', '78 Sector 18, Noida, Uttar Pradesh', 'Rahul Verma', '9876501234', 10, 5),
(4, 'Happy Tails Home', '22 Park Street, Kolkata, West Bengal', 'Priya Sen', '9832109876', 25, 18),
(5, 'Safe Haven for Strays', '19 Nehru Nagar, Chennai, Tamil Nadu', 'Vikram Iyer', '9445567890', 12, 7),
(6, 'Animal Care Trust', '5 MG Marg, Pune, Maharashtra', 'Anjali Patil', '9822334455', 18, 12),
(7, 'Stray Rescue India', '34 Green Road, Ahmedabad, Gujarat', 'Kiran Shah', '9898076543', 16, 9),
(8, 'Pet Haven', '50 NH Road, Hyderabad, Telangana', 'Ravi Kumar', '9876345120', 14, 8),
(9, 'Kindness Shelter', '66 Old Bus Stand, Kochi, Kerala', 'Anita Nair', '9847012345', 20, 13),
(10, 'Love for Paws', '10 Civil Lines, Jaipur, Rajasthan', 'Rohit Sharma', '9829012345', 10, 6),
(11, 'Shelter for All', '11 Residency Road, Lucknow, Uttar Pradesh', 'Sanjay Gupta', '9839011122', 15, 9),
(12, 'Animal Aid', '90 New Colony, Bhopal, Madhya Pradesh', 'Sneha Dubey', '9754321234', 22, 14),
(13, 'Care Shelter', '7 Rajendra Nagar, Patna, Bihar', 'Amit Kumar', '9123456780', 18, 11),
(14, 'Pet Support Center', '23 Main Street, Chandigarh', 'Pooja Mehra', '9878123456', 12, 5),
(15, 'Helping Paws', '45 City Center, Surat, Gujarat', 'Neha Shah', '9898123456', 14, 8),
(16, 'Companion Shelter', '88 Jubilee Hills, Hyderabad, Telangana', 'Arvind Rao', '9876543211', 16, 12),
(17, 'Animal Rescue Home', '56 Outer Ring Road, Bengaluru, Karnataka', 'Ramesh Reddy', '9745612345', 25, 18),
(18, 'Friendly Paws', '32 MG Road, Goa', "Sonia D'Souza", '9823123456', 10, 4),
(19, 'Care for Creatures', '18 Mission Street, Pondicherry', 'Hari Krishnan', '9842012345', 12, 6),
(20, 'Paw Protectors', '77 Shastri Nagar, Nagpur, Maharashtra', 'Shivani Patil', '9823012345', 20, 14);



-- Insert 20 records into the Pets table aligned with the FosterHomes table

INSERT INTO Pets (PetID, Name, Species, Breed, Age, Gender, Status, RescueDate, AdoptionDate, FosterHomeID) VALUES
(1, 'Golu', 'Dog', 'Indian Pariah', 3, 'Female', 'Available', '2025-01-01', NULL, 1),
(2, 'Simran', 'Cat', 'Persian', 2, 'Male', 'Available', '2025-01-05', NULL, 2),
(3, 'Raja', 'Dog', 'Mudhol Hound', 4, 'Male', 'Available', '2025-01-10', NULL, 3),
(4, 'Laxmi', 'Dog', 'Rajapalayam', 5, 'Female', 'Available', '2025-01-15', NULL, 4),
(5, 'Chintu', 'Cat', 'Spotted Cat', 2, 'Female', 'Available', '2025-01-20', NULL, 5),
(6, 'Munni', 'Dog', 'Pandikona', 1, 'Male', 'Available', '2025-01-25', NULL, 6),
(7, 'Meow', 'Cat', 'Bengal', 3, 'Female', 'Available', '2025-01-30', NULL, 7),
(8, 'Sheru', 'Dog', 'Combai', 6, 'Male', 'Available', '2025-02-01', NULL, 8),
(9, 'Billu', 'Cat', 'Maine Coon', 4, 'Male', 'Available', '2025-02-05', NULL, 9),
(10, 'Rani', 'Dog', 'Chippiparai', 2, 'Female', 'Available', '2025-02-10', NULL, 10),
(11, 'Tiger', 'Dog', 'Kombai', 5, 'Male', 'Available', '2025-02-15', NULL, 11),
(12, 'Mishti', 'Cat', 'Ragdoll', 3, 'Female', 'Available', '2025-02-20', NULL, 12),
(13, 'Shankar', 'Dog', 'Jonangi', 4, 'Male', 'Available', '2025-02-25', NULL, 13),
(14, 'Chikoo', 'Cat', 'Abyssinian', 2, 'Female', 'Available', '2025-03-01', NULL, 14),
(15, 'Bhola', 'Dog', 'Himalayan Sheepdog', 5, 'Male', 'Available', '2025-03-05', NULL, 15),
(16, 'Sheela', 'Cat', 'Birman', 4, 'Female', 'Available', '2025-03-10', NULL, 16),
(17, 'Raja', 'Dog', 'Bakharwal', 3, 'Male', 'Available', '2025-03-15', NULL, 17),
(18, 'Zara', 'Cat', 'Scottish Fold', 2, 'Female', 'Available', '2025-03-20', NULL, 18),
(19, 'Kalu', 'Dog', 'Rampur Greyhound', 6, 'Male', 'Available', '2025-03-25', NULL, 19),
(20, 'Heera', 'Dog', 'Gaddi Kutta', 4, 'Female', 'Available', '2025-03-30', NULL, 20);



-- Insert 20 records into the Adopters table

INSERT INTO Adopters (AdopterID, Name, Email, Phone, Address) VALUES
(1, 'Amit Sharma', 'amit.sharma@fsm.ac.in', '9876543210', 'Delhi, India'),
(2, 'Neha Verma', 'neha.verma@fsm.ac.in', '9123456789', 'Mumbai, Maharashtra'),
(3, 'Rohit Gupta', 'rohit.gupta@fsm.ac.in', '9822334455', 'Pune, Maharashtra'),
(4, 'Priya Singh', 'priya.singh@fsm.ac.in', '9876501234', 'Lucknow, Uttar Pradesh'),
(5, 'Arjun Reddy', 'arjun.reddy@fsm.ac.in', '9745612345', 'Hyderabad, Telangana'),
(6, 'Sneha Dubey', 'sneha.dubey@fsm.ac.in', '9754321234', 'Bhopal, Madhya Pradesh'),
(7, 'Kiran Shah', 'kiran.shah@fsm.ac.in', '9898076543', 'Ahmedabad, Gujarat'),
(8, 'Ravi Kumar', 'ravi.kumar@fsm.ac.in', '9876345120', 'Chennai, Tamil Nadu'),
(9, 'Anita Nair', 'anita.nair@fsm.ac.in', '9847012345', 'Kochi, Kerala'),
(10, 'Ramesh Reddy', 'ramesh.reddy@fsm.ac.in', '9876543211', 'Bengaluru, Karnataka'),
(11, "Sonia D'Souza", 'sonia.dsouza@fsm.ac.in', '9823123456', 'Panaji, Goa'),
(12, 'Hari Krishnan', 'hari.krishnan@fsm.ac.in', '9842012345', 'Pondicherry'),
(13, 'Shivani Patil', 'shivani.patil@fsm.ac.in', '9823012345', 'Nagpur, Maharashtra'),
(14, 'Anjali Mehta', 'anjali.mehta@fsm.ac.in', '9832109876', 'Jaipur, Rajasthan'),
(15, 'Vikram Iyer', 'vikram.iyer@fsm.ac.in', '9445567890', 'Chennai, Tamil Nadu'),
(16, 'Rohit Sharma', 'rohit.sharma@fsm.ac.in', '9829012345', 'Jaipur, Rajasthan'),
(17, 'Sanjay Gupta', 'sanjay.gupta@fsm.ac.in', '9839011122', 'Lucknow, Uttar Pradesh'),
(18, 'Pooja Mehra', 'pooja.mehra@fsm.ac.in', '9878123456', 'Chandigarh'),
(19, 'Neha Shah', 'neha.shah@fsm.ac.in', '9898123456', 'Surat, Gujarat'),
(20, 'Arvind Rao', 'arvind.rao@fsm.ac.in', '9876543211', 'Hyderabad, Telangana');



-- Insert 20 records into the MedicalRecords table

INSERT INTO MedicalRecords (MedicalRecordID, PetID, VaccinationDate, DiseaseHistory, IsVaccinated, Notes) VALUES
(1, 1, '2024-12-15', 'None', TRUE, 'Healthy and active.'),
(2, 2, '2024-12-18', 'Allergic to dust', TRUE, 'Requires dust-free environment.'),
(3, 3, '2024-12-20', 'Skin infection (recovered)', TRUE, 'Fully recovered, no special care needed.'),
(4, 4, '2024-12-25', 'None', TRUE, 'Energetic and playful.'),
(5, 5, '2024-12-28', 'Eye infection (under treatment)', FALSE, 'Needs regular eye drops.'),
(6, 6, '2025-01-02', 'None', TRUE, 'Friendly and adaptable.'),
(7, 7, '2025-01-05', 'Limp in hind leg (recovering)', FALSE, 'Physiotherapy recommended.'),
(8, 8, '2025-01-08', 'None', TRUE, 'Vaccinations up to date.'),
(9, 9, '2025-01-10', 'Heartworm treatment (completed)', TRUE, 'Healthy post-treatment.'),
(10, 10, '2025-01-12', 'None', TRUE, 'Calm and affectionate.'),
(11, 11, '2025-01-15', 'Ear infection (under treatment)', FALSE, 'Needs ear cleaning and medication.'),
(12, 12, '2025-01-18', 'None', TRUE, 'Perfect for adoption.'),
(13, 13, '2025-01-20', 'None', TRUE, 'Well-socialized and healthy.'),
(14, 14, '2025-01-22', 'Anxiety (mild)', TRUE, 'Prefers a quiet home.'),
(15, 15, '2025-01-25', 'None', TRUE, 'Loves outdoor activities.'),
(16, 16, '2025-01-28', 'Dental issues (under treatment)', FALSE, 'Requires dental care.'),
(17, 17, '2025-01-30', 'None', TRUE, 'Very friendly with children.'),
(18, 18, '2025-02-02', 'None', TRUE, 'Loves attention and cuddles.'),
(19, 19, '2025-02-05', 'Obesity (managed)', TRUE, 'On a controlled diet.'),
(20, 20, '2025-02-10', 'None', TRUE, 'Excellent health and active.' );



-- Insert 20 records into the Rescuers table

INSERT INTO Rescuers (RescuerID, Name, Phone, Organization, AdopterID, PetID, RescueDate) VALUES
(1, 'Arjun Reddy', '9876543210', 'Paws for Hope', 1, 1, '2025-01-01'),
(2, 'Neha Verma', '9123456789', 'Care for Animals', 2, 2, '2025-01-05'),
(3, 'Rohit Gupta', '9822334455', 'Animal Savers', 3, 3, '2025-01-10'),
(4, 'Priya Singh', '9876501234', 'Furry Friends Rescue', 4, 4, '2025-01-15'),
(5, 'Kiran Shah', '9898076543', 'Stray Rescue India', 7, 5, '2025-01-20'),
(6, 'Ravi Kumar', '9876345120', 'Happy Paws Shelter', 8, 6, '2025-01-25'),
(7, 'Anita Nair', '9847012345', 'Care for Strays', 9, 7, '2025-01-30'),
(8, 'Ramesh Reddy', '9876543211', 'Pet Helpers Foundation', 10, 8, '2025-02-01'),
(9, 'Hari Krishnan', '9842012345', 'Compassionate Care', 12, 9, '2025-02-05'),
(10, "Sonia D'Souza", '9823123456', 'Love for Paws', 11, 10, '2025-02-10'),
(11, 'Shivani Patil', '9823012345', 'Fur Haven', 13, 11, '2025-02-15'),
(12, 'Anjali Mehta', '9832109876', 'Forever Friends', 14, 12, '2025-02-20'),
(13, 'Vikram Iyer', '9445567890', 'Helping Tails', 15, 13, '2025-02-25'),
(14, 'Rohit Sharma', '9829012345', 'Care Shelter Foundation', 16, 14, '2025-03-01'),
(15, 'Sanjay Gupta', '9839011122', 'Home for Strays', 17, 15, '2025-03-05'),
(16, 'Pooja Mehra', '9878123456', 'Pet Protectors', 18, 16, '2025-03-10'),
(17, 'Neha Shah', '9898123456', 'Kindness Crew', 19, 17, '2025-03-15'),
(18, 'Arvind Rao', '9876543211', 'Animal Angels', 20, 18, '2025-03-20'),
(19, 'Sneha Dubey', '9754321234', 'Healing Paws', 6, 19, '2025-03-25'),
(20, 'Rohit Gupta', '9822334455', 'Stray Love Society', 3, 20, '2025-03-30');


-- Insert 20 more records into the Pets table with Indian names and Indian breeds

INSERT INTO Pets (PetID, Name, Species, Breed, Age, Gender, Status, RescueDate, AdoptionDate, FosterHomeID) VALUES
(21, 'Tipu', 'Dog', 'Indian Pariah', 2, 'Male', 'Available', '2025-02-15', NULL, 1),
(22, 'Chintu', 'Dog', 'Rajapalayam', 3, 'Male', 'Available', '2025-02-16', NULL, 2),
(23, 'Gudiya', 'Dog', 'Chippiparai', 4, 'Female', 'Available', '2025-02-17', NULL, 3),
(24, 'Shera', 'Dog', 'Kombai', 5, 'Male', 'Available', '2025-02-18', NULL, 4),
(25, 'Moti', 'Dog', 'Mudhol Hound', 2, 'Male', 'Available', '2025-02-19', NULL, 5),
(26, 'Rani', 'Dog', 'Bakharwal', 3, 'Female', 'Available', '2025-02-20', NULL, 6),
(27, 'Golu', 'Dog', 'Gaddi Kutta', 4, 'Male', 'Available', '2025-02-21', NULL, 7),
(28, 'Bhola', 'Dog', 'Himalayan Sheepdog', 5, 'Male', 'Available', '2025-02-22', NULL, 8),
(29, 'Heera', 'Dog', 'Jonangi', 6, 'Female', 'Available', '2025-02-23', NULL, 9),
(30, 'Raja', 'Dog', 'Pandikona', 2, 'Male', 'Available', '2025-02-24', NULL, 10),
(31, 'Bittu', 'Dog', 'Indian Pariah', 3, 'Male', 'Available', '2025-02-25', NULL, 11),
(32, 'Sonu', 'Dog', 'Chippiparai', 4, 'Male', 'Available', '2025-02-26', NULL, 12),
(33, 'Chikoo', 'Dog', 'Rajapalayam', 5, 'Male', 'Available', '2025-02-27', NULL, 13),
(34, 'Munna', 'Dog', 'Kombai', 2, 'Male', 'Available', '2025-02-28', NULL, 14),
(35, 'Meera', 'Dog', 'Mudhol Hound', 3, 'Female', 'Available', '2025-03-01', NULL, 15),
(36, 'Laxmi', 'Dog', 'Bakharwal', 4, 'Female', 'Available', '2025-03-02', NULL, 16),
(37, 'Kalu', 'Dog', 'Gaddi Kutta', 5, 'Male', 'Available', '2025-03-03', NULL, 17),
(38, 'Maya', 'Dog', 'Himalayan Sheepdog', 6, 'Female', 'Available', '2025-03-04', NULL, 18),
(39, 'Sheela', 'Dog', 'Jonangi', 2, 'Female', 'Available', '2025-03-05', NULL, 19),
(40, 'Ravi', 'Dog', 'Pandikona', 3, 'Male', 'Available', '2025-03-06', NULL, 20);



-- Enforce FOREIGN KEY Constraints
SET FOREIGN_KEY_CHECKS = 1;
