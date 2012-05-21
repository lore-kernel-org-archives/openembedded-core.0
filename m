Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWO40-0007vk-4L for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 10:34:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4L8NrwU018743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17869-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4L8NlvJ018737
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:48 +0100
Message-ID: <1337588627.11345.606.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2012 09:23:47 +0100
In-Reply-To: <CAOHjBZvpd8TN04-BixZYRBM9OkYqmxhw37czLdN1wO4Ex0ZqrQ@mail.gmail.com>
References: <CAOHjBZvpd8TN04-BixZYRBM9OkYqmxhw37czLdN1wO4Ex0ZqrQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: About RPMs installation
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
X-List-Received-Date: Mon, 21 May 2012 08:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-21 at 09:12 +0200, Giuseppe Condorelli wrote:
> Hi All,
>  
> can I have an help about rpms installation, once they were built by
> oc-core?
> I produced both .tgz and rpms, I'm wondering how to install them
> (maybe using chroot, but I'm newbe
> about it).
> Please, have you suggestions?


They can either be pre-installed as a complete image using one of the
image targets (like core-image-minimal), or you can install them on your
target device manually.

Cheers,

Richard




