Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R2Rk8-0004q8-6I
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 19:53:28 +0200
Received: from [192.168.2.9] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 33E46A617B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 19:48:19 +0200 (CEST)
Message-ID: <4E6BA2E2.7090301@eukrea.com>
Date: Sat, 10 Sep 2011 19:48:18 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+2YH7vrG5b5ZH+_YSG6-F_fJT54rL_0B7JCjr9UiHRSiXdmJQ@mail.gmail.com>
In-Reply-To: <CA+2YH7vrG5b5ZH+_YSG6-F_fJT54rL_0B7JCjr9UiHRSiXdmJQ@mail.gmail.com>
Subject: Re: udev mirror
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
X-List-Received-Date: Sat, 10 Sep 2011 17:53:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 10/09/2011 19:06, Enrico a =E9crit :
> since kernel.org is down udev (173) can't be fetched, do you know a
> mirror that can be used?
>
> I've tried one that i found googling around but i think it's not
> updated and i get build errors.
>

git://mirrors.arsc.edu/kernel/scm/linux/hotplug/udev.git;protocol=3Dhttp
worked here yesterday

Eric


