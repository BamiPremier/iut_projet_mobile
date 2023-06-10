import 'package:Fahkap/Views/ComplementView/SplashScreen.dart';
import 'package:Fahkap/Views/HomeView.dart';
import 'package:Fahkap/Views/ListReservation.dart';
import 'package:Fahkap/Views/ListSalle.dart';
import 'package:Fahkap/Views/ListBatiment.dart';
import 'package:Fahkap/Views/ComplementView/AboutUsView.dart';
import 'package:Fahkap/Views/ListUtilisateur.dart';
import 'package:Fahkap/Views/LoginScreen.dart';
import 'package:Fahkap/Views/RegisterScreen.dart';
// import 'package:Fahkap/Views/Home/AcheterBillet.dart';
import 'package:get/get.dart';

var transitionX = Transition.zoom;

class AppRoutes {
  static final pages = [
    GetPage(
        name: AppLinks.SPLASHSCREEN,
        page: () => SplashScreenPage(),
        transition: transitionX),
    GetPage(
        name: AppLinks.LOGIN,
        page: () => LoginScreen(),
        transition: transitionX),
    GetPage(
        name: AppLinks.REGISTER,
        page: () => RegisterScreen(),
        transition: transitionX),
    GetPage(
        name: AppLinks.HOME,
        children: [],
        page: () => HomeView(),
        transition: transitionX),

    GetPage(
        name: AppLinks.LIST_RESERV,
        children: [],
        page: () => ListReservation(),
        transition: transitionX),
    GetPage(
        name: AppLinks.LIST_SALLE,
        children: [],
        page: () => ListSalle(),
        transition: transitionX),
    GetPage(
        name: AppLinks.LIST_BATIMENT,
        children: [],
        page: () => ListBatiment(),
        transition: transitionX),
    GetPage(
        name: AppLinks.LIST_UTILISATEUR,
        children: [],
        page: () => ListUtilisateur(),
        transition: transitionX), 
  ];
}

class AppLinks {
  static const String SPLASHSCREEN = "/splashscreen";
  static const String LOGIN = "/login";
  static const String REGISTER = "/register";
  static const String HOME = "/home";
  static const String LIST_RESERV = "/LR";
  static const String LIST_SALLE = "/LS";
  static const String LIST_BATIMENT = "/LB";
  static const String LIST_UTILISATEUR = "/LU";
}

// <?php

// namespace App\Controller;

// use App\Entity\Boutique;
// use App\Entity\BoutiqueObject;
// use App\Entity\Category;
// use App\Entity\Localisation;
// use App\Entity\ModePaiement;
// use App\Entity\ProduitObject;
// use App\Entity\Short;
// use App\Entity\User;
// use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
// use Symfony\Component\HttpFoundation\JsonResponse;
// use Symfony\Component\HttpFoundation\Response;
// use Symfony\Component\Routing\Annotation\Route;
// use Symfony\Component\HttpFoundation\Request;

// use FFMpeg\FFMpeg;
// use FFMpeg\Format\Video\X264;

// use FFI\Exception;
// use Symfony\Contracts\HttpClient\Exception\ClientExceptionInterface;
// use Symfony\Contracts\HttpClient\Exception\DecodingExceptionInterface;
// use Symfony\Contracts\HttpClient\Exception\RedirectionExceptionInterface;
// use Symfony\Contracts\HttpClient\Exception\ServerExceptionInterface;
// use Symfony\Contracts\HttpClient\Exception\TransportExceptionInterface;
// use Symfony\Component\String\Slugger\SluggerInterface;

// use Doctrine\ORM\EntityManagerInterface;
// use Symfony\Contracts\HttpClient\HttpClientInterface;
// use App\FunctionU\MyFunction;
// use Symfony\Component\HttpFoundation\File\Exception\FileException;

// class ShortController extends AbstractController
// {
//     private $em;
//     private $clientWeb;
//     private $myFunction;
//     private $FFMpeg;
//     private $X264;
//     public function __construct(
//         EntityManagerInterface $em,
//         HttpClientInterface $clientWeb,
//         MyFunction
//         $myFunction,
//         FFMpeg $FFMpeg,
//         X264 $X264

//     ) {
//         $this->X264 = $X264;
//         $this->FFMpeg = $FFMpeg;
//         $this->em = $em;
//         $this->myFunction = $myFunction;

//         $this->clientWeb = $clientWeb;
//     }

//     /**
//      * @Route("/short/read", name="ShortRead", methods={"GET"})
//      * @param Request $request
//      * @return JsonResponse
//      * @throws ClientExceptionInterface
//      * @throws DecodingExceptionInterface
//      * @throws RedirectionExceptionInterface
//      * @throws ServerExceptionInterface
//      * @throws TransportExceptionInterface
//      * @throws \Exception
//      * 
//      * 
//      * @param array $data doit contenir la  la keySecret du
//      * 
//      * 
//      */
//     public function ShortRead(Request $request)
//     {

//         // $typeCompte = $AccountEntityManager->getRepository(TypeCompte::class)->findOneBy(['id' => 1]);

//         $possible = false;

//         $serializer = $this->get('serializer');

//         $lShortF = [];

//         $lShort = $this->em->getRepository(Short::class)->findAll();
//         foreach ($lShort as $short) {




//             $shortF =  [

//                 'id' => $short->getId(),
//                 'titre' => $short->getTitre() ?? "Aucun",
//                 'description' => $short->getDescription() ?? "Aucun",
//                 'status' => $short->isStatus(),
//                 'src' => /*  $_SERVER['SYMFONY_APPLICATION_DEFAULT_ROUTE_SCHEME'] */ 'http' . '://' . $_SERVER['HTTP_HOST'] . '/videos/shorts/' . $short->getSrc(),
//                 'date' =>
//                 date_format($short->getDateCreated(), 'Y-m-d H:i'),



//             ];
//             array_push($lShortF, $shortF);
//         }

//         return
//             new JsonResponse(
//                 [
//                     'data'
//                     =>  $lShortF,


//                 ],
//                 200
//             );
//     }

//     /**
//      * @Route("/short/new", name="ShortNew", methods={"POST"})
//      * @param Request $request
//      * @return JsonResponse
//      * @throws ClientExceptionInterface
//      * @throws DecodingExceptionInterface
//      * @throws RedirectionExceptionInterface
//      * @throws ServerExceptionInterface
//      * @throws TransportExceptionInterface
//      * @throws \Exception
//      * 
//      * 
//      * @param array $data doit contenir la  la keySecret du
//      * 
//      * 
//      */
//     public function ShortNew(Request $request, SluggerInterface $slugger)
//     {


//         // $typeCompte = $AccountEntityManager->getRepository(TypeCompte::class)->findOneBy(['id' => 1]);

//         $possible = false;

//         $serializer = $this->get('serializer');


//         $data = [

//             'titre' => $request->get('titre'),
//             'description' => $request->get('description'),

//             'codeBoutique' => $request->get('codeBoutique'),
//         ];

//         if (
//             empty($data['titre']) || empty($data['description'])


//             || empty($data['codeBoutique'])
//         ) {
//             return new JsonResponse(
//                 [
//                     'message' => 'Verifier votre requette'
//                 ],
//                 400
//             );
//         }

//         $titre = $data['titre'];
//         $description = $data['description'];


//         $boutique = $this->em->getRepository(Boutique::class)->findOneBy(['codeBoutique' => $data['codeBoutique']]);

//         $file = $request->files->get('file');



//         if ($file) {
//             $originalFilenameData = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
//             // this is needed to safely include the file name as part of the URL
//             $safeFilenameData = $slugger->slug($originalFilenameData);
//             $newFilenameData =
//                 $this->myFunction->getUniqueNameProduit() . '.' . $file->guessExtension();
//             // Move the file to the directory where brochures are stored
//             try {
//                 $ffmpeg =
//                     $this->FFMpeg::create();

//                 // Ouverture de la vidéo avec FFMpeg
//                 $video = $ffmpeg->open($file->getPathname());
//                 $video = $ffmpeg->open($file->getPathname());
//                 $format = $this->X264;
//                 // $format->setAudioCodec("aac");
//                 // $format->setVideoCodec("libx264");
//                 // $format->setPixelFormat("yuv420p");
//                 $video->save($format, $file->getPathname() . '.mp4');
//                 $file->move(
//                     $this->getParameter('shorts_object'),
//                     $newFilenameData
//                 );
//                 $short = new Short();
//                 $short->setSrc($newFilenameData);
//                 $short->setTitre($titre);
//                 $short->setDescription(
//                     $description
//                 );
//                 $short->setBoutique($boutique);
//                 $this->em->persist($short);

//                 $imagePresent = true;
//             } catch (FileException $e) {
//                 return
//                     new JsonResponse([

//                         'status' =>   false,
//                         'message' =>   'Vos fichiers ne sont pas valides'

//                     ], 203);
//             }
//         }

//         $this->em->flush();

//         return
//             new JsonResponse(
//                 [
//                     'message'
//                     =>  'success'
//                 ],
//                 200
//             );
//     }
// }
 