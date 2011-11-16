Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RQoAO-0004Z6-9E
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 23:41:16 +0100
Received: by faat2 with SMTP id t2so2241697faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 14:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=/WYuUEqE0ah7X64jpXrndSf5ymhZiF8mywpiF6WDOyA=;
	b=KgJMjJjsVBcJ3avfuH9wbuXjPqXCYCvEjBfp6hj/28eC9zwl7Z8sodOIJHcsezt35/
	MtMAZBuaIX7lCmxekeRgekMX/Loa8bSqc1hZkDwI3cFE5LT21rfijVVEqA5NntAQgEYC
	38jlf1AsSe9nV1g+Q4fRzZoardEf15AaAHDEg=
Received: by 10.152.109.199 with SMTP id hu7mr21845558lab.16.1321482892153;
	Wed, 16 Nov 2011 14:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.12.36 with HTTP; Wed, 16 Nov 2011 14:34:21 -0800 (PST)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E39E9243@orsmsx504.amr.corp.intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
	<806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
	<839d81b7f8239d5c3fb01646653d3414ba03dd23.1321470758.git.nitin.a.kamble@intel.com>
	<CAMKF1srTzN83+xUVu3NJyNacFAXB9Tu82adE9XZwQ6yE_RC2pA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E39E9243@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Nov 2011 14:34:21 -0800
Message-ID: <CAMKF1soWxtrLcydQVq6R5mpCke8tYgO3dzSB_6Jw7sc5W3LcLA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
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
X-List-Received-Date: Wed, 16 Nov 2011 22:41:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2011 at 2:26 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
> Khem,
> =C2=A0 I did not see that commit, and I find the oecore/yocto is still be=
hind for the version of libtool recipe. Any reason that commit is not in oe=
core?
>
> Thanks,

there were some feedback on the patch I have to look thru it.


