Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyUXd-0000XB-A0 for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 22:04:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UJxIbB029048;
	Tue, 30 Aug 2011 20:59:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20955-03; Tue, 30 Aug 2011 20:59:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UJxBvL029034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2011 20:59:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.morscher@hs-augsburg.de, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
In-Reply-To: <4E5D3FDC.6030901@hs-augsburg.de>
References: <1314720867.5939.361.camel@rex> <4E5D3FDC.6030901@hs-augsburg.de>
Date: Tue, 30 Aug 2011 20:58:59 +0100
Message-ID: <1314734339.5939.411.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gtk-icon-cache: add hicolor-icon-theme to DEPENDS
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
X-List-Received-Date: Tue, 30 Aug 2011 20:04:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-30 at 21:54 +0200, Michael Morscher wrote:
> Thanks for your answer. That patch hasn't fixed it for me, also the 
> others don't... I checked your and Koens old conversations and tried all 
> those patches, but no change :(
>
> I have no idea why and some DEPEND and RDEPEND things didn't fix it as 
> well. I'm not a pro at the moment.
> 
> I'm running the git master and copied those patches or manually edited 
> the smaller things. I'm not sure but all other gnome/X (not gpe) things 
> are broken due to that error.

I'm a little confused as if you're running master, you should already
have those patches applied?

Cheers,

Richard



