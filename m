Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwABR-0000hp-KL for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:00:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VAmbN3020006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:48:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19675-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:48:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VAmInu020000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:48:29 +0100
Message-ID: <1343731697.3360.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 11:48:17 +0100
In-Reply-To: <cover.1343689827.git.paul.eggleton@linux.intel.com>
References: <cover.1343689827.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] do_populate_sdk fixes
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
X-List-Received-Date: Tue, 31 Jul 2012 11:00:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-31 at 00:10 +0100, Paul Eggleton wrote:
> The following changes since commit ab0187c13b2b0a041bf3d98c3a53bd3f45a624de:
> 
>   libxcb: Update for python-native changes (2012-07-30 16:53:49 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/sdk-rpmresolve
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdk-rpmresolve
> 
> Paul Eggleton (2):
>   classes/populate_sdk_base: don't break existing do_populate_sdk
>     depends
>   classes/populate_sdk_rpm: add depends on rpmresolve-native

Merged to master, thanks.

Richard



