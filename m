Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RvmrM-0003th-Ui
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 10:33:41 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=SrPpmUqdz5YcrSTGsjAYkBOboVD5mvRWpwRnC6Q8XuUi5EbUud2axBpP
	jzu5RJbd0VbzQcb9wHIsO1LeXR/Cg5C/p6hR1/UU+G+pno6q9owGUqxFy
	WaP5QpwmO1BnqBkkJiTOmSpYv2G/RypzpS5bbkUJFOEMRDsuWE2rH3/wr
	NID2Fhqp8Op/hi1y2tuXxPDCPJ7LQeeuqPP1gR6aoVqNdymcIEUbNPyPC
	vZZc45Zhh0L06s5cvnCu+ctlvmxDt;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1328865938; x=1360401938;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=qrd3LCyyd6OC6qH2uDCqCa3KmPRnNjm6/6fxa2ct0rI=;
	b=mfGhXE07JJ5TMS3wlLz8duil3fZGYPPdXdMT9xhfkEJmlyagBJ/+71OA
	dzOzvfEVlELhfbVHBP1b0kcAcpzIvqDJGhCbGWF2jiI62jBD9LTJ23EYV
	5cDnUvUFZj9SJNPZPx6WBODfLuZJ4/+ni5NNxXRh6lWtz68ZANKgcLNAp
	YVW4Za127wamrNqlzGYV08DKLfpzLYrnQRlGkLcwCoJEsjUNFkR97W6LC
	buklDSbZGDhdCzHyDWulpuGvLSZyW;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.73,395,1325458800"; d="scan'208";a="86006454"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 10 Feb 2012 10:25:37 +0100
X-IronPort-AV: E=Sophos;i="4.73,394,1325458800"; d="scan'208";a="128917050"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 10 Feb 2012 10:25:37 +0100
Message-ID: <4F34E291.8060303@ts.fujitsu.com>
Date: Fri, 10 Feb 2012 10:25:37 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F34D48B.3040007@ts.fujitsu.com>
	<1328865863.4215.10.camel@mattotaupa>
In-Reply-To: <1328865863.4215.10.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: Problems with recipe for openmotif-2.3.0
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
X-List-Received-Date: Fri, 10 Feb 2012 09:33:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 10.02.2012 10:24, schrieb Paul Menzel:

> are you using OE-Classic or OE-Core?

OE-core

Rainer


