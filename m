Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REh1n-0008SZ-SD for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 14:38:20 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ECdE1A013389 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:39:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jygDFVV5tFAx
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:39:14 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ECdC7N013371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:39:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 13:32:28 +0100
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318595557.2342.10.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] Qt4 and image building improvements
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
X-List-Received-Date: Fri, 14 Oct 2011 12:38:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 14:41 +0000, Otavio Salvador wrote:
> The following changes since commit 5ad1ca59dea6d5045f252ed7b786ad193faced64:
> 
>   xf86-video-intel: Update 2.15.0 -> 2.16.0 (2011-10-12 22:59:14 +0100)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (4):
>   image-live.bbclass: allow override of initrd image
>   initramfs-live-boot: make it more generic and easy to use
>   qt4: use 4.7.4 as default preference
>   distro_tracking_fields.inc: update qt4 related entries

Merged to master, thanks.

Richard



