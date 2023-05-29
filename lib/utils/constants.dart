import 'package:flutter/material.dart';

const String routeHome = 'home';
const String routeAbout = 'about';
const String routeContacts = 'contact';
const String routeServices = 'services';

const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);

const kDefaultPadding = 20.0;
const TextStyle kPageTitleStyle = TextStyle(fontSize: 20.0);
final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

const String ramalingamText =
    'In public recongnition of the valuable services to the community rendered in the field of child welfare our director was honurned by her excellency the president of india, Shrimati Pratibha Devisingh patil, with National Award for child welfare,2009 pm 14th november 2010';

const String ramalingamTextFull =
    'Mr. S. Ramalingam (M.A (PSY), M.A (SOC), M.Sc (Phy), M.Ed (SPL.Edn), LLB, B.ED (PHYSICAL SCIENCE & MATHS), Sr.DS.Edn, TSLD. FOUNDER & HONY. DIRECTOR MARUTI SEVA & MARUTI VIDHYALAYA. MEMBER, TAMILNADU STATE CHILD RIGHTS PROTECTION COMMISSION, GOVT. OF TAMILNADU FORMER MEMBER, CHILD WELFARE COMMITTEE, DEPT. OF SOCIAL DEFENSE, GOVT. OF TAMILNADU (CHENNAI, KRISHNAGIRI & DHARMAPURI DIST.) was born on July 27, 1967 in Dharmapuri district, Tamilnadu, has over 28 years of experience in the field of intellectual disability/difficulties and child education.He received his Master Degree in Psychology and Sociology from Annamalai University. He did his Graduation in Physics from Govt. Arts College, Dharmapuri and B.Ed(Physical Science and Mathmatics) from Govt. College of Education, Kumarapalayam, Salem. He served as a primary school teacher from 1989 – 1990 and after that he did Senior Diploma in Special Education from Balavihar Training School, Chennai. He joined as a Special Educator in Ashraya Centre for Special Education and worked there till 30th January 1999. He undergone a course on Tutor Training in Specific Learning Difficulties in Alpha to Omega Learning Centre on 1995. He started Maruti Seva Centre for Special Education on 31st January 1999 at Kolathur, Chennai with the aim to serve the children with Autism, ADHD, Mental Retardation, Learning Disability and slow learners. The school was started with three special children and now grew up as a big banyan tree serving hundreds of children with special needs. He served as a Child Welfare Committee Member, of the Dept. of Social Defence, Govt. of Tamilnadu, under the Juvenile Justice Act 2000, in Chennai, Dharmapuri & Krishnagiri Districts from 2003 – 2011 for the upliftment of the orphan and the children from low socio-economic stratum. He is associated with NIMH, RCI and various government and nongovernmental bodies. \n He designs appropriate curriculum, teaching strategies and teaching learning materials for school children. He creates awarenees among the public by organizing seminars and workshops on learning difficulties and importance of remedial education. He also provide guidance and counseling for slow learners and children with learning difficulties. \n Dr. S. Ramalingam was honoured by her Excellency the President of India, Shrimati Pratibha Devisingh Patil,with National Award for Child Welfare , 2009 on 14th November 2010 for his complete dedication in the development of Maruti Seva Centre for Special Education as a Role Model Special School in the entire nation.';
String loremIpsum =
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';
const String aboutUsBulletText1 =
    "Maruti Seva Centre for Special Education is one among the best schools in India for the children with Intellectual Disabilities (Mentally Subnormal - Mild, Moderate, Severe and Autism – educable, trainable and custodial group and Intellectual Difficulties (Slow Learners and Learning Disabilities).";
const String aboutUsBulletText2 =
    "We are a leader in rehabilitation, habilitation and child education and in the delivery of integrated child development services.";
const String aboutUsBulletText3 =
    "We believe in uniqueness of all children and the power of families. ";
const String aboutUsBulletText4 =
    "We also believe in interdisciplinary approach towards overall development of the child.";
const String aboutUsBulletText5 =
    "We believe in creativity, innovation and in challenging barriers. In partnership with parents, we develop and implement innovative programs and services to enhance the quality of life for children and their families.";
const String aboutUsBulletText6 =
    "We dedicate ourselves to the cause and provide services in all the related areas focusing on the children with intellectual disabilities/difficulties. Since learning disability/difficulty is a hidden disability which does not allow the child to perform to his/her actual is a potential, the under achievement of an otherwise intelligent child is puzzling to both teachers and parents alike";
const String aboutUsBulletText7 =
    " Timely identification and appropriate help will ensure that these children continue in the mainstream of education and their potential is fully tapped.";
const String aboutUsBulletText8 =
    "Founded in 31st January 1999 in Chennai, India, we have over 20 years of experience of working with children with learning difficulties. We use several educational therapy techniques and learning strategies to motivate children to learn, to think deeply and critically, and expect more of themselves. By building and strengthening fundamental cognitive skills, we positively impact children to be intellectually independent and to live life in the long run.";
