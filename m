Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgxvJ-0004rs-CJ for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:48:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBZ8Lk028814
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:35:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:35:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBYxbN028796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:34:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310496679.git.nitin.a.kamble@intel.com>
References: <cover.1310496679.git.nitin.a.kamble@intel.com>
Date: Wed, 13 Jul 2011 12:34:57 +0100
Message-ID: <1310556897.20015.1114.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] a bugfix & fix for couple of qa warnings
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
X-List-Received-Date: Wed, 13 Jul 2011 11:48:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 11:52 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
> 
>   insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/misc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
> 
> Nitin A Kamble (3):
>   binutils: package unpackaged files
>   eglibc: fix installed but not packaged files
>   eglibc: fix runtime assertion failure

Merged to master, thanks.

Richard



