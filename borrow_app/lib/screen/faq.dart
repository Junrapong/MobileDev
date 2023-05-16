import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

final questions = [
  {
    'question': 'What is this program for?',
    'answer':
        'Asset borrowers who are able to borrow equipment from the central part of the university will have the option to borrow equipment for ease of use in situations where they lack necessary equipment for their work.'
  },
  {
    'question': 'Who is eligible to borrow assets?',
    'answer':
        'Students who register on the app in connection with the university can borrow equipment and will have the ability to borrow on behalf of other university students.'
  },
  {
    'question': 'How do I request to borrow an asset?',
    'answer':
        'You can borrow equipment by finding the desired item on the home page, adding it to your cart, and selecting the date for which you would like to borrow the equipment. After adding the equipment to your cart, you can submit a request to borrow it.'
  },
  {
    'question': 'How long can I borrow an asset for?',
    'answer': 'Can be borrowed for a period of 1-7 days, no more.'
  },
  {
    'question': 'Can I renew my borrowing period if I need more time?',
    'answer':
        'You can request to borrow equipment by setting a new period. When a new request has been submitted Admin will check again.'
  },
];

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.1,
          title: const Text(
            'FAQ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index]['question'];
                final answer = questions[index]['answer'];
                return ExpansionTile(
                  title: Text(question!),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(answer!),
                    ),
                  ],
                );
              },
            )));
  }
}
