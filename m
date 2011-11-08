Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNpeV-000634-G1 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 18:40:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8HXndB002948
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 17:33:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02911-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 17:33:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8HXe6E002942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 17:33:41 GMT
Message-ID: <1320773623.10843.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 17:33:43 +0000
In-Reply-To: <d66b2dd9538139b16969e63a08199cbb25c6cd0c.1320772004.git.josh@linux.intel.com>
References: <cover.1320772004.git.josh@linux.intel.com>
	<d66b2dd9538139b16969e63a08199cbb25c6cd0c.1320772004.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] clutter-gst: fix patch filename
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
X-List-Received-Date: Tue, 08 Nov 2011 17:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 09:10 -0800, Joshua Lock wrote:
> Munged the patch filename somehow. Apologies for the noise.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  ...{enable_tests-1.8.bb => enable_tests-1.8.patch} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-graphics/clutter/clutter-gst/{enable_tests-1.8.bb => enable_tests-1.8.patch} (100%)

Merged to master, thanks.

Richard



