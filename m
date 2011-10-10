Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDBux-0003Dc-HN for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 11:13:03 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9DwXD008198 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:13:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4isOW8Tg11An
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:13:58 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9A9DuJF008179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:13:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 10:07:16 +0100
In-Reply-To: <1317843972-4213-1-git-send-email-raj.khem@gmail.com>
References: <1317843972-4213-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318237644.23801.1.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] shared-mime-info: Upgrade recipes from 0.90 -> 0.91
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
X-List-Received-Date: Mon, 10 Oct 2011 09:13:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 12:46 -0700, Khem Raj wrote:
> The parallel build problems are solved upstream therefore removed
> 
> License file has been corrected to use 'GNU Lesser GPL' instead of
> 'GNU library GPL' and some indentation changes
> 
> The license is LGPLv2+ therefore mark it so
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Merged to master, thanks.

Richard



