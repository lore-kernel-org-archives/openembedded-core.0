Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Se4KV-00073J-To for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 15:06:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCuEp1014954
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:56:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13603-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:56:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5BCu6Fe014948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 13:56:07 +0100
Message-ID: <1339419369.30460.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2012 13:56:09 +0100
In-Reply-To: <1339147825-24242-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1339147825-24242-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] nasm: updated to 2.10.01
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
X-List-Received-Date: Mon, 11 Jun 2012 13:06:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 12:30 +0300, Bogdan Marinescu wrote:
> Tested by compiling syslinux
> 
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../nasm/{nasm_2.07.bb => nasm_2.10.01.bb}         |   11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>  rename meta/recipes-devtools/nasm/{nasm_2.07.bb => nasm_2.10.01.bb} (58%)

Merged to master, thanks.

Richard



