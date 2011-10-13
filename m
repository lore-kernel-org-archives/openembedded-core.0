Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REV5Y-0006vu-MB for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 01:53:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9DNsJ85019741 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 00:54:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G33xF-uMUCPD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 00:54:19 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9DNsFbf019737
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 00:54:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 00:47:32 +0100
In-Reply-To: <1318510421-9351-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318510421-9351-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318549661.23801.250.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] xf86-video-intel_2.16.0: fix buildfix.patch to apply
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
X-List-Received-Date: Thu, 13 Oct 2011 23:53:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 14:53 +0200, Martin Jansa wrote:
> ---
>  .../xorg-driver/xf86-video-intel/buildfix.patch    |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 

Merged to master, thanks!

Not sure how I wasn't seeing this locally, still trying to figure that
out...

Richard



