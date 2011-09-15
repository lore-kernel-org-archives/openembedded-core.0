Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4KC6-00055x-L4 for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 00:14:07 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8FMEx68015983 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:15:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HC-ZJ77262LK
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:14:59 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8FMEuKR015977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:14:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2011 23:08:44 +0100
In-Reply-To: <cover.1316096375.git.Martin.Jansa@gmail.com>
References: <cover.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316124533.25993.28.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/5] Small fixes
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
X-List-Received-Date: Thu, 15 Sep 2011 22:14:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-15 at 16:24 +0200, Martin Jansa wrote:
> The following changes since commit e876a44fa8ed0aa2e09084c1e7ddfc876c3f981b:
> 
>   cml1/kernel: Update do_menuconfig to use oe.terminal() (2011-09-15 11:22:39 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> 
> Martin Jansa (5):
>   openssh: update init script to create ECDSA keys if needed
>   task-core-boot: allow distributions to define login and init manager
>   subversion: remove neon-detection.patch and --with-neon option
>   abiword: be carefull with # comments ending with backslash
>   claws-mail: be carefull with # comments ending with backslash

Merged to master, thanks.

Richard



