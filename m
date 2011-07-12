Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qgdx3-0000vI-Td for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:28:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CEO3ab021057
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:24:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21024-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:23:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CENr16021051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 15:23:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5d74762c2631c97aee2bbebc5e0baf56fa4ed1ad.1310048449.git.ke.yu@intel.com>
References: <cover.1310048449.git.ke.yu@intel.com>
	<5d74762c2631c97aee2bbebc5e0baf56fa4ed1ad.1310048449.git.ke.yu@intel.com>
Date: Tue, 12 Jul 2011 15:23:51 +0100
Message-ID: <1310480631.20015.1064.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] sato-sdk: add clutter for sato-sdk image
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
X-List-Received-Date: Tue, 12 Jul 2011 14:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 22:22 +0800, Yu Ke wrote:
> Yocto ADT has Eclips clutter template, so it is better to have
> clutter in SDK image to support ADT. this patch add clutter
> and clutter-box2d app to sato-sdk image for this purpose
> 
> Fix [YOCTO #891]
> 
> Signed-off-by: Yu Ke <ke.yu@intel.com>

Merged to master, thanks.

Richard



