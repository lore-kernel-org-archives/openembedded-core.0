Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW49V-0000Nd-2p; Thu, 01 Dec 2011 11:46:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AdNZe013065;
	Thu, 1 Dec 2011 10:39:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12488-04; Thu,  1 Dec 2011 10:39:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AdFQ9013059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Dec 2011 10:39:16 GMT
Message-ID: <1322735964.17484.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 10:39:24 +0000
In-Reply-To: <cover.1322716218.git.sgw@linux.intel.com>
References: <cover.1322716218.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 0/3] A few more updates
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
X-List-Received-Date: Thu, 01 Dec 2011 10:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 21:12 -0800, Saul Wold wrote:
> Richard,
> 
> This address the missing checksums and patches from my
> last set.  Also added here is libffi.
> 
> iconv will come later, there was a different problem that I need
> to track down.
> 
> Sau!
> 
> 
> The following changes since commit f4efaa0f472b4bf0ba0a0297cc9ecc8b5a671f72:
> 
>   squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:40 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates
> 
> Saul Wold (3):
>   xserver-xorg*: Update to 1.11.2
>   gnutls: Update to 2.12.14
>   libffi: Update to 3.0.10

Merged to master, thanks.

Richard



