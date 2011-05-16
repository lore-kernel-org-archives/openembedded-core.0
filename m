Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLyvR-0005cD-Ka for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 16:37:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEYjou020348
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 15:34:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19826-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 15:34:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEYc08020342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 15:34:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Date: Mon, 16 May 2011 15:34:37 +0100
Message-ID: <1305556477.3424.82.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/15] 14-May Consolidated Pull
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
X-List-Received-Date: Mon, 16 May 2011 14:37:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
> From: Saul Wold <sgw@linux.intel.com>
> 
> Richard,
> 
> Some LSB Fixes from Kang, ARM and MACHINEOVERRIDES tweaks from
> Khem, and some glib and defaultsetup changes from Martin.
> Along with a QT4 Update from Paul.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: sgw/stage
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

I took these apart from:

> Khem Raj (4):
>   tune-cortexa8.inc: Define variable for controlling FP ABI
>   gcc-common.inc: Consider hardfp knob for configuring toolchain
>
> Martin Jansa (3):
>   bitbake.conf: move VENDOR variables from bitbake.conf to
>     defaultsetup.conf
> 
> Nitin A Kamble (1):
>   task-core-nfs: fix a bitbake error

Which I've sent replies about.

Cheers,

Richard



