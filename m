Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7336E771A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QHaCbp007758; Fri, 26 Feb 2016 17:36:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CzFfm06oLlzd; Fri, 26 Feb 2016 17:36:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QHa884007754
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 26 Feb 2016 17:36:09 GMT
Message-ID: <1456508168.11498.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2016 17:36:08 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Yocto Project Status WW09
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 17:36:17 -0000
Content-Type: multipart/mixed; boundary="=-jJLpRv3E4lYoMgRZzwBd"

--=-jJLpRv3E4lYoMgRZzwBd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.1 M3
Next Deadline: YP 2.1 M3 Cutoff (Feature Freeze) February 29, 2016
 
SWAT team rotation: Tracy -> Alejandero
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
 
Key Status/Updates:
* 2.1 Feature Freeze is upon us. If there is any feature you want to 
  see in 2.1 which isn't going to make the deadline, talk to RP.
* We plan to release 2.1 M2 despite the sato glib issue, granting an
  exception for the high bug and then  concentrate on 2.1 M3.
* 2.1 M3 build won't happen until sato glib issue resolved.
* Also planning to merge the gobject-introspection changes 
* Pseudo connection issue appears to be addressed with increased retry 
  numbers. Tests ongoing.
* We're about to try and transition meta-yocto within meta-yocto to 
  meta-poky. The amount of pain this is causing is horrible :(.
* We're considering a bump in the minimum git version requirements 
  due to the requirements of various pieces of project tooling.
* We're rebuilding jethro 2.0.1 due to the glibc security issue, now 
  at -rc7.
 
Key YP 2.1 Dates:
YP 2.1 M2 Target release date is February 12, 2016 (Will slip a few
weeks.)
YP 2.1 M3 Cutoff (Feature Freeze) date is February 29, 2016 noon GMT
YP 2.1 M3 Target release date is March 18, 2016
YP 2.1 M4 / Final Cutoff: March 28, 2016 noon GMT - Stabilization only
milestone.
YP 2.1 Final Release Target: April 29, 2016
 
Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.1_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.1_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.1_Features
 
Tracking Metrics:
            WDD 2565 (last week 2585)
(https://wiki.yoctoproject.org/charts/combo.html)
 
[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]
 
Thanks,
 
Richard-- 
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=-jJLpRv3E4lYoMgRZzwBd--
