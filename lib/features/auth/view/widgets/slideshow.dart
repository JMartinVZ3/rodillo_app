// ignore_for_file: use_key_in_widget_constructors

part of 'widgets.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({
    required this.slides,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (SlideshowController controller) {
      controller.colorPrimario = colorPrimario;
      controller.colorSecundario = colorSecundario;

      controller.bulletPrimario = bulletPrimario;
      controller.bulletSecundario = bulletSecundario;

      return _CrearEstructuraSlideshow(slides: slides);
    });
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.slides,
  }) : super(key: key);

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: _Slides(slides)),
        _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (i) => _Dot(i),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Get.find<SlideshowController>();
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = Get.find<SlideshowController>().pageViewController;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Get.find<SlideshowController>().currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: slide,
    );
  }
}
