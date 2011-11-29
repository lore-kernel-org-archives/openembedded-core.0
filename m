Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RVJT1-0007T7-Fd
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:55:07 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0B9244B054E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:48:21 +0100 (CET)
Message-ID: <4ED49C54.8030300@eukrea.com>
Date: Tue, 29 Nov 2011 09:48:20 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com> <4ED0DDBF.9000104@eukrea.com>
	<1322394029.4798.16.camel@ted>
In-Reply-To: <1322394029.4798.16.camel@ted>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Tue, 29 Nov 2011 08:55:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 27/11/2011 12:40, Richard Purdie a =C3=A9crit :
> To help me get further data points on this issue, are you using rm_work=
?
> Do the recent changes in master help (the bitbake sstate/task_skip()
> ones in particular)? I've not been able to reproduce this :(
>
OK I don't seem to reproduce it with head (but I now meet a new problem w=
ith=20
base-passwd, see coming mail).

Eric


