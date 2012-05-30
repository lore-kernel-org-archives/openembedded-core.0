Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhkz-0003zv-Rz for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:12:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC1mKW021788
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:01:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21338-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:01:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC1ehA021782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:01:40 +0100
Message-ID: <1338379299.20169.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 13:01:39 +0100
In-Reply-To: <cover.1338224754.git.paul.eggleton@linux.intel.com>
References: <cover.1338224754.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] sanity.bbclass improvements for Hob
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
X-List-Received-Date: Wed, 30 May 2012 12:12:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-28 at 18:10 +0100, Paul Eggleton wrote:
> The following changes since commit 363424cdc78cafa278008f973c2b4288297ebf8c:
> 
>   image.bbclass: Ensure ${S} is cleaned at the start of rootfs generation (2012-05-25 11:28:00 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/hob-sanity-oecore
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/hob-sanity-oecore
> 
> Paul Eggleton (2):
>   classes/sanity: send sanity check failure as a separate event for Hob
>   classes/sanity: fix a couple of grammatical errors in messages

Merged to master, thanks.

Richard



