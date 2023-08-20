import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_storage_app/configs/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,  this.title='', required this.onTap, this.enabled=true, this.child, this.color});

  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 60,
        child: InkWell(
          onTap: enabled==false?null:onTap,
          child: Center(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color??Theme.of(context).cardColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: child??Center(
                  child: Text(title,style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: onSurfaceTextColor
                ),),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}