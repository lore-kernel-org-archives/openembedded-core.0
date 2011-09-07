Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1QBr-0001pV-4M for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 00:01:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M2jQo029222 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:02:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PihATrUn3Yxl
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 23:02:45 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p87M2hPL029203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2011 23:02:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
Date: Wed, 07 Sep 2011 22:56:40 +0100
Message-ID: <1315432600.13021.24.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 0/4] Some miscellaneous bugfixes
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
X-List-Received-Date: Wed, 07 Sep 2011 22:01:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-07 at 17:05 +0100, Paul Eggleton wrote:
> The following changes since commit cb8efc0e1ec00892b46325aabfb1b4020a46c078:
> 
>   linux-yocto: re-enable utrace (2011-09-07 14:53:38 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/fixes5
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes5
> 
> Paul Eggleton (4):
>   core-image.bbclass: zap root password if debug-tweaks not enabled
>   sanity.bbclass: re-enable DISTRO check
>   meta/recipes.txt: correct Qt capitalisation
>   base.bbclass: fix substring matching in COMMERCIAL_LICENSE

Merged to master, thanks.

Richard



