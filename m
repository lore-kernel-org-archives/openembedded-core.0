Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMh5W-0001Rj-Pe for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:46:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4IDWUpq028382
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:32:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28212-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:32:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4IDWON6028376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:32:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305709034.git.paul.eggleton@linux.intel.com>
References: <cover.1305709034.git.paul.eggleton@linux.intel.com>
Date: Wed, 18 May 2011 14:32:21 +0100
Message-ID: <1305725541.3424.317.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Qt4 cleanup
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
X-List-Received-Date: Wed, 18 May 2011 13:46:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 10:08 +0100, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Remove Qt 4.6.3 in favour of 4.7.3 (which should be binary compatible with
> 4.6.x), add Upstream-Status to remaining patches and re-enable some patches
> that were missed with the original upgrade to 4.7.x.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: paule/qt4-cleanup-core
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-cleanup-core
> 
> Thanks,
>     Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> 
> 
> Paul Eggleton (3):
>   qt4: remove Qt 4.6.3
>   qt4: add comments and Upstream-Status to all patches
>   qt4: re-enable two 4.6.x patches in 4.7.3

I think the previous questions on the mailing list provided enough time
for discussion of this so merged to master, thanks. 

Cheers,

Richard





