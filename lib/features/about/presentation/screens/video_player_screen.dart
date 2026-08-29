import 'package:flutter/material.dart';
import 'package:hassanzamin/features/about/provider/about_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AboutVideoPlayerScreen extends StatelessWidget {
  final String videoId;
  final String title;

  const AboutVideoPlayerScreen({
    super.key,
    required this.videoId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return _AboutVideoPlayerContent(videoId: videoId, title: title);
  }
}

class _AboutVideoPlayerContent extends StatefulWidget {
  final String videoId;
  final String title;

  const _AboutVideoPlayerContent({required this.videoId, required this.title});

  @override
  State<_AboutVideoPlayerContent> createState() =>
      _AboutVideoPlayerContentState();
}

class _AboutVideoPlayerContentState extends State<_AboutVideoPlayerContent> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        enableKeyboard: true,
        strictRelatedVideos: true,
      ),
    );

    _controller.listen(_listener);
  }

  void _listener(YoutubePlayerValue value) {
    final loader = context.read<LoaderProvider>();

    final bool videoReady =
        value.playerState == PlayerState.playing ||
        value.playerState == PlayerState.buffering ||
        value.metaData.videoId.isNotEmpty;

    if (loader.load && videoReady) {
      loader.setLoading(false);
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;
    final bool tablet = width >= 768 && width < 1200;

    final double playerWidth = mobile
        ? width
        : tablet
        ? width * 0.90
        : width * 0.75;

    // Listen to Provider ONLY inside build().
    final bool loadering = context.watch<LoaderProvider>().load;

    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        backgroundColor: Colors.black,

        // ------------------------------------------------------
        // APP BAR
        // ------------------------------------------------------
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // ------------------------------------------------------
        // BODY
        // ------------------------------------------------------
        body: Stack(
          children: [
            // --------------------------------------------------
            // YOUTUBE PLAYER
            // --------------------------------------------------

            Center(
              child: Container(
                width: playerWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YoutubePlayer(controller: _controller),
                ),
              ),
            ),

            // --------------------------------------------------
            // LOADING OVERLAY
            // --------------------------------------------------
            if (loadering)
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: loadering ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    color: Colors.black,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.amber,
                            strokeWidth: 3,
                          ),

                          SizedBox(height: 20),

                          Text(
                            'Loading Video...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
