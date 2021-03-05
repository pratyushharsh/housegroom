class DomesticHelperSearchOptionItems {
  final String tag;
  final String description;
  DomesticHelperSearchOptionItems({this.tag, this.description})
      : assert(tag != null);
}

class DomesticHelperSearchOption {
  final String headerTag;
  final String headerDescription;
  final String imageUrl;
  final List<DomesticHelperSearchOptionItems> items;

  DomesticHelperSearchOption(
      this.headerTag, this.headerDescription, this.imageUrl, this.items);
}

// class _SearchState extends State<Search> {
//   //TODO: add images
//   List<Item> _items = <Item>[
//     Item(
//       header: "Types of Services",
//       body: "body1",
//       image: Image.asset(
//         'images/service.png',
//       ),
//     ),
//     Item(
//       header: "specialities",
//       body: "body3",
//       image: Image.asset('images/speciality.png'),
//     ),
//     Item(
//       header: "Gender",
//       body: "body2",
//       image: Image.asset('images/gender.png'),
//     ),
//     Item(
//       header: "Age",
//       body: "body3",
//       image: Image.asset('images/age.png'),
//     ),
//     Item(
//       header: "Experience",
//       body: "body3",
//       image: Image.asset('images/Experience.png'),
//     ),
//   ];

// ignore: non_constant_identifier_names
List<DomesticHelperSearchOption> SEARCH_OPTIONS = [
  DomesticHelperSearchOption(
      "SERVICE_TYPES", "Types of Service", 'images/service.png', [
    DomesticHelperSearchOptionItems(tag: "FULL_TIME", description: "Full Time"),
    DomesticHelperSearchOptionItems(tag: "PART_TIME", description: "Part Time"),
    DomesticHelperSearchOptionItems(tag: "ON_DEMAND", description: "On Demand")
  ]),
  DomesticHelperSearchOption(
      "SPECIALITIES", "SPECIALITIES", 'images/speciality.png', [
    DomesticHelperSearchOptionItems(
        tag: "COOK_NON_VEG", description: "Cooking-Non Veg"),
    DomesticHelperSearchOptionItems(
        tag: "COOK_VEG", description: "Cooking Veg"),
    DomesticHelperSearchOptionItems(tag: "CLEANING", description: "Cleaning"),
    DomesticHelperSearchOptionItems(
        tag: "UTENSIL_CLEANING", description: "Utensil CLeaning")
  ]),
  DomesticHelperSearchOption("GENDER", "Gender", 'images/gender.png', [
    DomesticHelperSearchOptionItems(tag: "MALE", description: "Male"),
    DomesticHelperSearchOptionItems(tag: "FEMALE", description: "Female"),
    DomesticHelperSearchOptionItems(
        tag: "TRANS_GENDER", description: "Transgender")
  ]),
  DomesticHelperSearchOption("AGE", "Age", 'images/age.png', [
    DomesticHelperSearchOptionItems(
        tag: "18_20_YRS", description: "10-20 Years"),
    DomesticHelperSearchOptionItems(
        tag: "21_25_YRS", description: "21-25 Years"),
    DomesticHelperSearchOptionItems(
        tag: "26-30_YRS", description: "26-30 years")
  ]),
  DomesticHelperSearchOption(
      "EXPERIENCE", "Experience", 'images/Experience.png', [
    DomesticHelperSearchOptionItems(tag: "0_1_YRS", description: "0-1 Years"),
    DomesticHelperSearchOptionItems(tag: "2_5_YRS", description: "2-5 Years"),
    DomesticHelperSearchOptionItems(tag: "6_10_YRS", description: "6-10 years")
  ]),
];
