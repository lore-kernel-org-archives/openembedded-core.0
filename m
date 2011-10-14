Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REhGe-0000SK-UD for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 14:53:49 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ECsXg1014467 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:54:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MM6+upUwJ2Uh
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:54:33 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ECsR59014441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:54:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 13:47:43 +0100
In-Reply-To: <1315913433-32608-2-git-send-email-s.stirtzel@googlemail.com>
References: <1315913433-32608-1-git-send-email-s.stirtzel@googlemail.com>
	<1315913433-32608-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318596472.2342.15.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] data.py: fixed message domain errors
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
X-List-Received-Date: Fri, 14 Oct 2011 12:53:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 13:30 +0200, Samuel Stirtzel wrote:
> The dynamic message domain was introduced by Richard Purdie with the following patch:
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a6c48298b17e6a5844b3638b422fe226e3b67b89
> 
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta/lib/oe/data.py |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Patches 1 and 2 merged to master, thanks.

Sorry about the delay.

Richard



