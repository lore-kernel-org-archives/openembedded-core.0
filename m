Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBD4c-0007aC-Jx for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:02:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94M3bCD025236 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 23:03:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2H23a6GU7+Dg
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 23:03:37 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94M3YiB025233
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 23:03:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 22:57:04 +0100
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317765432.14671.115.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Minor and trivial fixes
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
X-List-Received-Date: Tue, 04 Oct 2011 22:02:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-02 at 18:15 +0000, Otavio Salvador wrote:
> The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d9:
> 
>   base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (3):
>   image.bbclass: improve comments regarding exported functions
>   image-live.bbclass: allow images to override ROOTFS and INITRD
>   bootimg.bbclass: fix comment typo
> 
>  meta/classes/bootimg.bbclass    |    2 +-
>  meta/classes/image-live.bbclass |    4 ++--
>  meta/classes/image.bbclass      |    5 +----
>  3 files changed, 4 insertions(+), 7 deletions(-)

Merged to master, thanks.

Richard




