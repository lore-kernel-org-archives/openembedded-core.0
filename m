Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QsxpS-0000s5-FL for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:07:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FE38Bx017389;
	Mon, 15 Aug 2011 15:03:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16215-08; Mon, 15 Aug 2011 15:03:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FE30Oc017383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Aug 2011 15:03:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <cover.1313411289.git.ke.yu@intel.com>
References: <cover.1313411289.git.ke.yu@intel.com>
Date: Mon, 15 Aug 2011 15:02:58 +0100
Message-ID: <1313416978.14274.579.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] two qt fix
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
X-List-Received-Date: Mon, 15 Aug 2011 14:07:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 20:33 +0800, Yu Ke wrote:
> The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:
>   Darren Hart (1):
>         rt-tests: use an explicit commit ID
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib kyu3/bug-1344
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug-1344
> 
> Yu Ke (2):
>   qt4.inc: revise RRECOMMENDS
>   qt4.inc: expand the package name for multilib case

Merged to master, thanks.

Richard



