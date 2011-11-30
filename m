Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVsqR-0001ri-LC for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:41:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMYwvG006564;
	Wed, 30 Nov 2011 22:34:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05846-10; Wed, 30 Nov 2011 22:34:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMYoMu006558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 22:34:51 GMT
Message-ID: <1322692498.17484.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 22:34:58 +0000
In-Reply-To: <4A209D73-09F9-45B2-9C5C-F87766C15286@dominion.thruhere.net>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srx1t4d1c6JNV0gS_+Kaa6KR50DfmgP=+ETrm-2BX+HUQ@mail.gmail.com>
	<4A209D73-09F9-45B2-9C5C-F87766C15286@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 22:41:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 23:27 +0100, Koen Kooi wrote:
> Op 30 nov. 2011, om 23:20 heeft Khem Raj het volgende geschreven:
> > On Wed, Nov 30, 2011 at 6:58 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:

> >> -DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
> >> +DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
> > 
> > is zlib a new dep or was it missing ?
> 
> Not sure, but configure.ac wants it, so I added it explicitly.

Consider trimming down quoted email to what is relevant please. The
above is perfectly legible and much shorter than the original two
replies.

Cheers,

Richard



