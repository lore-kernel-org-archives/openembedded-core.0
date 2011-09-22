Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6pXf-0007bB-Rs for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 22:06:44 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK7cmO029216 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:07:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SB3YKupMLCXU
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:07:38 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK7UbH029211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 21:07:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 21:01:14 +0100
In-Reply-To: <cover.1316711477.git.mark.hatle@windriver.com>
References: <cover.1316711477.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316721679.28323.2.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Update cups and foomatic
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
X-List-Received-Date: Thu, 22 Sep 2011 20:06:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 12:12 -0500, Mark Hatle wrote:
> Based on RP's comments to the previous foomatic-filter update, I have
> reviewed and revised both cups and foomatic-filters.
> 
> The following changes since commit 468e4a2f0e63e9d33e88b98a7d075b186ef481b2:
> 
>   glib-2.0: Drop old 2.27.5 development version (2011-09-22 08:47:22 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/rpm
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm
> 
> Mark Hatle (2):
>   cups: Fix recipe to use the correct cups directories
>   foomatic-filters: Disable filter checking

Merged to master, thanks.

Richard



