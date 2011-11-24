Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTiHr-0004Jq-0j for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 00:00:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOMsQsc031684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:54:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31009-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:54:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOMsH75031678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:54:18 GMT
Message-ID: <1322175264.10928.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 22:54:24 +0000
In-Reply-To: <cover.1321319621.git.scott.a.garman@intel.com>
References: <cover.1321319621.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Some Upstream-Status patch updates
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
X-List-Received-Date: Thu, 24 Nov 2011 23:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 17:14 -0800, Scott Garman wrote:
> Taking care of a few patch straglers that were missing Upstream-Status.
> 
> The following changes since commit f2316ff39670ed99382411e15ac035550360fbdd:
> 
>   opkg: Ensure we use the uname/gname fields when extracting tarballs (2011-11-14 11:15:36 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib sgarman/upstream-status-updates
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/upstream-status-updates
> 
> Scott Garman (2):
>   dosfstools: add Upstream-Status to patches
>   base-passwd: add Upstream-Status to patches, remove unused patch

Merged to master, thanks.

Richard



