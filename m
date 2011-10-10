Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDFUC-0004pL-Pk for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 15:01:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AD2ZHB022071 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:02:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VS5Av66z7eZg
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:02:35 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AD2UNa022061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:02:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 13:55:47 +0100
In-Reply-To: <3641B9F4-58D3-4AA1-B3D8-A08C57A97A11@dominion.thruhere.net>
References: <3641B9F4-58D3-4AA1-B3D8-A08C57A97A11@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318251360.23801.29.camel@ted>
Mime-Version: 1.0
Subject: Re: shared-mime-info fails to build if intltool-native is present
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
X-List-Received-Date: Mon, 10 Oct 2011 13:01:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-09 at 16:34 +0200, Koen Kooi wrote:
> I finally tracked down the cause of the intermittent shared-mime-info
> build failures I was seeing. No patch yet, but now you all know what's
> causing it :)

Try the patch I just sent to the list ;-)

Cheers,

Richard



