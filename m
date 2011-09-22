Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6dCN-0002xn-2C for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:55:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M6uncS024965 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:56:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W+JW0NfzkMaJ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:56:49 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M6ufbX024960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:56:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 07:50:20 +0100
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D859ECC3@shsmsx501.ccr.corp.intel.com>
References: <1316670765.13622.31.camel@ted>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D859ECC3@shsmsx501.ccr.corp.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316674233.2029.2.camel@ted>
Mime-Version: 1.0
Subject: Re: glib-2.0_2.27.5
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
X-List-Received-Date: Thu, 22 Sep 2011 06:55:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 13:56 +0800, Xu, Dongxiao wrote:
> I think we don't need it. I brought that recipe in but later I realize it is an development version.
> I didn't remove 2.27 that time to track the bleeding version. Since
> currently the latest version is 2.28.x in poky, we can move 2.27.5.

Ok, thats what I thought. I've gone ahead and removed this.

Cheers,

Richard



